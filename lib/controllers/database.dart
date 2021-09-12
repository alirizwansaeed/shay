import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class DatabaseController extends GetxController {
  /// list of images location picked from user
  Rx<List<XFile>> pickedImagesList = Rx<List<XFile>>([]);

  ///
  Map<String, String> imagesPathInStorage = {};

  Future<void> postNewAdd() async {
    try {
      for (int index = 0; index < pickedImagesList.value.length; index++) {
        String? val = await Storage.uploadImageToStorage(
            pickedFile: pickedImagesList.value[index]);
        imagesPathInStorage.putIfAbsent('image:$index', () => val!);
      }

      PostNewAdModel _model = PostNewAdModel(
          category: 'ali',
          type: 'cheez',
          title: 'andgoor',
          description: 'this is good',
          price: '40',
          mobileNumber: '0234',
          itemCondition: 'new',
          city: 'okara',
          photos: imagesPathInStorage,
          status: 'publish',
          isFeatured: false,
          uid: '');
      await Database.postNewAdd(_model);
    } catch (e) {
      print(e);
    }
  }

  /// getting images from user
  void getImageFormUser() async {
    try {
      XFile? pickedImage = await PickImage.formGallery();
      pickedImagesList.update((val) {
        val!.add(pickedImage!);
      });
    } catch (e) {
      print(e);
      Get.showSnackbar(GetBar(
        title: 'Error',
        message: 'cant upload',
      ));
    }
  }
}
