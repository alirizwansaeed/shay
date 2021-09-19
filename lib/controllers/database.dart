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
  Rx<List<AdModel>> _adstream = Rx<List<AdModel>>([]);
  Rx<List<XFile>> imagePickerImageList = Rx<List<XFile>>([]);
  var isLoading = false.obs;

  List<AdModel> get adStream {
    return _adstream.value;
  }

  UserModel get userStream {
    if (_authController.currentUser != null) {
      _usernameStream.bindStream(
          Database.userNameStream(_authController.currentUser!.uid));
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

  Future<void> postNewAdd(AdModel model) async {
    Map<String, String> imagesPathInStorage = {};
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
    Database.updateUserName(uid: _authController.currentUser!.uid, name: name);
  }

  void pickPostNewAdImages() async {
    XFile? _userimage = await PickImage.pickImage();
    imagePickerImageList.update((val) {
      val!.add(_userimage!);
    });
  }
}
