import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class DatabaseController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  var _usernameStream = UserModel(name: "Shay User").obs;
  var _specificUserData =
      UserModel(name: 'Shay User', creationdate: Timestamp.now()).obs;
  Rx<List<AdModel>> _adstream = Rx<List<AdModel>>([]);
  Rx<List<XFile>> imagePickerImageList = Rx<List<XFile>>([]);
  var isLoading = false.obs;

  List<AdModel> get adStream {
    return _adstream.value;
  }

  UserModel get specificUserData {
    return _specificUserData.value;
  }

  UserModel get userStream {
    if (_authController.currentUser != null) {
      _usernameStream.bindStream(
          Database.currentuserStream(_authController.currentUser!.uid));
      return _usernameStream.value;
    } else {
      _usernameStream(UserModel(
        name: 'Shay User',
      ));
      return _usernameStream.value;
    }
  }

  @override
  void onInit() {
    //BIND ALL ADS STREAM
    _adstream.bindStream(Database.adsStream());

    super.onInit();
  }

  Future<void> fetchSpecificUser(String documentid) async {
    _specificUserData(
        UserModel(name: "Shay User", creationdate: Timestamp.now()));
    UserModel userModel = await Database.fetchSpecificUser(documentid);
    _specificUserData(userModel);
  }

  Future<void> postNewAdd(AdModel model) async {
    Map<String, String> imagesPathInStorage = {};
    if (imagePickerImageList.value.isEmpty) {
      return Get.showSnackbar(GetBar(
        titleText: Text(
          "pick atleast one image",
          style: TextStyle(color: Colors.white),
        ),
        messageText: SizedBox.shrink(),
        duration: const Duration(seconds: 3),
      ));
    }
    try {
      isLoading(true);
      Get.showSnackbar(GetBar(
        showProgressIndicator: true,
        isDismissible: false,
        titleText: Text(
          "Ad Posting in progress",
          style: TextStyle(color: Colors.white),
        ),
        messageText: SizedBox.shrink(),
      ));

      for (int index = 0; index < imagePickerImageList.value.length; index++) {
        String? val = await Storage.uploadPostImages(
            pickedFile: imagePickerImageList.value[index],
            uid: _authController.currentUser!.uid);
        imagesPathInStorage.putIfAbsent('$index', () => val!);
      }

      await Database.postNewAdd(
        model.copyWith(
          uid: _authController.currentUser!.uid,
          isFeatured: true,
          status: 'publish',
          photos: imagesPathInStorage,
        ),
      );
      imagePickerImageList.value.clear();
      Get.back();
      Get.showSnackbar(GetBar(
          titleText: Text(
            "Ad posted successfully",
            style: TextStyle(color: Colors.white),
          ),
          messageText: SizedBox.shrink(),
          duration: const Duration(seconds: 3)));
    } catch (e) {
      Get.back();
      Get.showSnackbar(GetBar(
        titleText: Text(
          "Ad posting fail",
          style: TextStyle(color: Colors.white),
        ),
        messageText: SizedBox.shrink(),
        duration: const Duration(seconds: 3),
      ));
    } finally {
      isLoading(false);
    }
  }

  void updateUserName(String name) async {
    Database.updateCurrentUserName(
        uid: _authController.currentUser!.uid, name: name);
  }

  void pickPostNewAdImages() async {
    if (imagePickerImageList.value.length >= 8) {
      return Get.showSnackbar(GetBar(
          titleText: Text(
            "You can post maximum 8 images",
            style: TextStyle(color: Colors.white),
          ),
          messageText: SizedBox.shrink(),
          duration: const Duration(seconds: 3)));
    } else {
      XFile? _userimage = await PickImage.pickImage();
      imagePickerImageList.update((val) {
        val!.add(_userimage!);
      });
    }
  }
}
