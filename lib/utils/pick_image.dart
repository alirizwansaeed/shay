import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<XFile?> pickImage() async {
    XFile? imagefile;
    if (GetPlatform.isMobile) {
      await Get.bottomSheet(BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.collections),
              title: Text('Pick Form Gallery'),
              onTap: () async {
                imagefile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Pick Form Camera'),
              onTap: () async {
                imagefile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                Get.back();
              },
            ),
          ],
        ),
      ));
      return imagefile;
    } else {
      return imagefile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
    }
  }

  static Future<XFile?> formGallery() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 100, maxWidth: 100);
      return image;
    } catch (e) {
      print(e);
    }
  }

  static Future<XFile?> formCamera() async {
    try {
      final XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.camera, maxHeight: 100, maxWidth: 100);

      return image;
    } catch (e) {
      print(e);
    }
  }
}
