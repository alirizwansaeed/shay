import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class DatabaseController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  Rx<List<AdModel>> _allAdsStream = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _featuredAdsStream = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _fetchedSpecificUserAdsList = Rx<List<AdModel>>([]);

  Rx<List<AdModel>> _searchedads = Rx<List<AdModel>>([]);

  Rx<List<XFile>> imagePickerImageList = Rx<List<XFile>>([]);
  var isUpladingImage = false.obs;

  var _fetchedUserData = UserModel().obs;

  var isLoading = false.obs;
  var adLikedByMe = false.obs;

  List<AdModel> get allAdsStream {
    return _allAdsStream.value;
  }

  List<AdModel> get searchedAds {
    return _searchedads.value;
  }

  List<AdModel> get featuredAdsStream {
    return _featuredAdsStream.value;
  }

  UserModel get fetchedUserData {
    return _fetchedUserData.value;
  }

  List<AdModel> get fetchedSpecificUserAdsList {
    return _fetchedSpecificUserAdsList.value;
  }

  @override
  void onInit() {
    //BIND ALL ADS STREAM
    _allAdsStream.bindStream(Database.allAdsStream());
    _featuredAdsStream.bindStream(Database.featuredAdsStream());

    super.onInit();
  }

  void fetchSpecificUserAds(String id) async {
    _fetchedSpecificUserAdsList([]);
    List<AdModel> ads = await Database.fetchSpecificUserAds(id);

    _fetchedSpecificUserAdsList(ads);
  }

  Future<UserModel> fetchUser(String uid) async {
    return await Database.fetchUser(uid);
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
      List modelvalues = [
        ...model.title!.toLowerCase().split(' '),
        ...model.category!.toLowerCase().split(' '),
        ...model.city!.toLowerCase().split(' ')
      ];
      List searchList = [];

      for (var a = 0; a < modelvalues.length; a++) {
        for (var i = 1; i <= modelvalues[a].length; i++) {
          searchList.add(modelvalues[a].substring(0, i));
        }
      }
      await Database.postNewAdd(
          model.copyWith(
            uid: _authController.currentUser!.uid,
            status: 'publish',
            photos: imagesPathInStorage,
          ),
          searchList);
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

  void updateUser(UserModel userModel) async {
    await Database.updateUser(
        userModel.copyWith(uid: _authController.currentUser!.uid));
  }

  Future<void> deleteImageonsinglePost(AdModel model, int index) async {
    if (model.photos!.length <= 1) {
      Get.snackbar(
          'Alteast one image required', 'Upload new image then remove it');
      return;
    }

    try {
      Map<String, String> imagesPathInStorage = {};
      List existedimges = model.photos!.values.toList();
      isUpladingImage(true);
      await Storage.deleteimage(existedimges[index]);
      existedimges.removeAt(index);
      for (var i = 0; i < existedimges.length; i++) {
        imagesPathInStorage.putIfAbsent('$i', () => existedimges[i]);
      }

      Database.updateAd(model.copyWith(photos: imagesPathInStorage), []);
    } catch (e) {
      print(e);
    } finally {
      isUpladingImage(false);
    }
  }

  Future<void> updatePostData(AdModel model) async {
    List modelvalues = [
      ...model.title!.toLowerCase().split(' '),
      ...model.category!.toLowerCase().split(' '),
      ...model.city!.toLowerCase().split(' ')
    ];
    List searchList = [];

    for (var a = 0; a < modelvalues.length; a++) {
      for (var i = 1; i <= modelvalues[a].length; i++) {
        searchList.add(modelvalues[a].substring(0, i));
      }
    }
    await Database.updateAd(model, searchList);
  }

  Future<void> updatePostPictures(AdModel model) async {
    if (model.photos!.length >= 8) {
      Get.snackbar('Max limit reach', 'You Can Upload Maximum 8 images');
      return;
    }

    try {
      List existedimges = model.photos!.values.toList();
      Map<String, String> imagesPathInStorage = {};
      XFile? _userimage = await PickImage.pickImage();
      isUpladingImage(true);
      String? pathinstorage = await Storage.uploadPostImages(
          pickedFile: _userimage!, uid: _authController.currentUser!.uid);
      existedimges.add(pathinstorage);
      for (var i = 0; i < existedimges.length; i++) {
        imagesPathInStorage.putIfAbsent('$i', () => existedimges[i]);
      }
      await Database.updateAd(model.copyWith(photos: imagesPathInStorage), []);
    } catch (e) {
      print(e);
    } finally {
      isUpladingImage(false);
    }
  }

  void pickPostNewAdImages() async {
    try {
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
    } catch (e) {
      print(e);
    }
  }

  Future<void> adLikedbyMe(String docid) async {
    adLikedByMe(false);
    var snapshot = await Database.fetchSingleAd(docid: docid);
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
    if (data['Likes'] == null) {
      adLikedByMe(false);
      return;
    }

    Map<String, dynamic> value = data['Likes'];

    value.forEach((key, value) {
      if (key == _authController.currentUser!.uid && value == true) {
        adLikedByMe(true);
        return;
      }
    });
  }

  Future<List<AdModel>> fetchCategory(String value) async {
    return await Database.fetchByCategory(value);
  }

  Future<void> searchads(String value) async {
    _searchedads([]);
    var snapshot = await Database.searchAds(value);

    _searchedads(snapshot);
  }
}
