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
            uid: Get.find<AuthenticationController>().currentUser!.uid,
            isFeatured: true,
            status: 'publish',
            photos: imagesPathInStorage),
      );
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
          title: 'Max limint reach',
          message: 'You can post Maximum 8 images',
        ));
        return;
      }
      XFile? pickedImage = await PickImage.formGallery();
      pickedImagesList.update((val) {
        val!.add(pickedImage!);
      });
    } catch (e) {}
  }
}
