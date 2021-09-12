import 'package:image_picker/image_picker.dart';

class PickImage {
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
