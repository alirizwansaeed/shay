import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class DatabaseController extends GetxController {
  /// list of images location picked from user
  Rx<List<XFile>> pickedImagesList = Rx<List<XFile>>([]);

  /// firebase storage link for acccessing images
  Map<String, String> imagesPathInStorage = {};

  /// loading state
  var isLoading = false.obs;

  Future<void> postNewAdd(PostNewAdModel model) async {
    try {
      isLoading(true);
      for (int index = 0; index < pickedImagesList.value.length; index++) {
        String? val = await Storage.uploadImageToStorage(
            pickedFile: pickedImagesList.value[index]);
        imagesPathInStorage.putIfAbsent('image$index', () => val!);
      }

      await Database.postNewAdd(
        model.copyWith(
            uid: 'sddf',
            isFeatured: true,
            status: 'publish',
            photos: imagesPathInStorage),
      );
      pickedImagesList.value.clear();
      imagesPathInStorage.clear();
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

  /// getting images from user
  void getImageFormUser() async {
    try {
      if (pickedImagesList.value.length == 8) {
        Get.showSnackbar(GetBar(
          title: 'Max limit Reach',
          message: 'You can post Maximum 8 images',
          duration: const Duration(seconds: 3),
        ));
        return;
      }
      if (GetPlatform.isMobile) {
        Get.bottomSheet(BottomSheet(
          onClosing: () {},
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.collections),
                title: Text('Pick Form Gallery'),
                onTap: () async {
                  XFile? pickedImage = await PickImage.formGallery();
                  pickedImagesList.update((val) {
                    val!.add(pickedImage!);
                  });
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Pick Form Camera'),
                onTap: () async {
                  XFile? pickedImage = await PickImage.formCamera();
                  pickedImagesList.update((val) {
                    val!.add(pickedImage!);
                  });
                  Get.back();
                },
              ),
            ],
          ),
        ));
      } else {
        XFile? pickedImage = await PickImage.formGallery();
        pickedImagesList.update((val) {
          val!.add(pickedImage!);
        });
      }
    } catch (e) {}
  }
}
