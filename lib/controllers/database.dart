import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class DatabaseController extends GetxController {
  final _authController = Get.find<AuthenticationController>();
  var userNameStream = UserModel(name: "Shay User").obs;
  Rx<List<AdModel>> _adstream = Rx<List<AdModel>>([]);

  /// list of images location picked from user
  Rx<List<XFile>> postAdImages = Rx<List<XFile>>([]);

  List<AdModel> get adStream {
    return _adstream.value;
  }

  /// loading state
  var isLoading = false.obs;

  UserModel get stream {
    if (_authController.currentUserState != null) {
      userNameStream.bindStream(
          Database.userNameStream(_authController.currentUser!.uid));
      return userNameStream.value;
    } else {
      userNameStream(UserModel(name: 'Shay User'));
      return userNameStream.value;
    }
  }

  @override
  void onInit() {
    _adstream.bindStream(Database.adsStream());

    super.onInit();
  }

  Future<void> postNewAdd(AdModel model) async {
    Map<String, String> imagesPathInStorage = {};
    try {
      isLoading(true);
      for (int index = 0; index < postAdImages.value.length; index++) {
        String? val = await Storage.uploadPostImages(
            pickedFile: postAdImages.value[index],
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
      postAdImages.value.clear();
      Get.back();
      Get.showSnackbar(GetBar(
        titleText: Text(
          "Ad Posted Successfully",
          style: TextStyle(color: Colors.white),
        ),
        messageText: SizedBox.shrink(),
        duration: const Duration(seconds: 3),
      ));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void updateUserName(String name) async {
    Database.updateUserName(uid: _authController.currentUser!.uid, name: name);
  }

  void pickPostNewAdImages() async {
    XFile? _userimage = await PickImage.pickImage();
    postAdImages.update((val) {
      val!.add(_userimage!);
    });
  }

  /// getting images from user
  // void getImageFormUser() async {
  //   try {
  //     if (postAdImages.value.length == 8) {
  //       Get.showSnackbar(GetBar(
  //         title: 'Max limit Reach',
  //         message: 'You can post Maximum 8 images',
  //         duration: const Duration(seconds: 3),
  //       ));
  //       return;
  //     }
  //     if (GetPlatform.isMobile) {
  //       Get.bottomSheet(BottomSheet(
  //         onClosing: () {},
  //         builder: (context) => Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: Icon(Icons.collections),
  //               title: Text('Pick Form Gallery'),
  //               onTap: () async {
  //                 XFile? pickedImage = await PickImage.formGallery();
  //                 postAdImages.update((val) {
  //                   val!.add(pickedImage!);
  //                 });
  //                 Get.back();
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.camera),
  //               title: Text('Pick Form Camera'),
  //               onTap: () async {
  //                 XFile? pickedImage = await PickImage.formCamera();
  //                 postAdImages.update((val) {
  //                   val!.add(pickedImage!);
  //                 });
  //                 Get.back();
  //               },
  //             ),
  //           ],
  //         ),
  //       ));
  //     } else {
  //       XFile? pickedImage = await PickImage.formGallery();
  //       postAdImages.update((val) {
  //         val!.add(pickedImage!);
  //       });
  //     }
  //   } catch (e) {}
  // }
}
