import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/pages/pages.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/dialogs.dart';
import 'package:shay/utils/searchlist.dart';
import 'package:shay/utils/utils.dart';

class PostAndEditAdsController extends GetxController {
  final _authController = Get.find<AuthenticationController>();
  Rx<List<XFile>> pickedImages = Rx<List<XFile>>([]);
  String get uid {
    return _authController.currentUser!.uid;
  }

  Future<void> postAd(AdModel model) async {
    Map<String, String> imagesUrl = {};
    List<String> searchList = SearchList.searchlist(model);

    try {
      Dialogs.loading();
      for (int index = 0; index < pickedImages.value.length; index++) {
        String? val = await Storage.uploadPostImages(
          pickedFile: pickedImages.value[index],
          uid: uid,
        );
        imagesUrl.putIfAbsent('$index', () => val!);
      }

      await Database.postNewAdd(
          model.copyWith(uid: uid, status: 'publish', photos: imagesUrl),
          searchList);

      pickedImages.value.clear();
      Dialogs.closeLoading();
      Get.offAllNamed(HomePage.routeName);
      Dialogs.successDialog('Ad successfully Post');
    } catch (e) {
      Dialogs.errorDialog("Ad Can't successfully post");
    } finally {
      Dialogs.closeLoading();
    }
  }

  Future<void> updatePostData(AdModel model) async {
    List<String> searchList = SearchList.searchlist(model);
    await Database.updateAd(model, searchList);
  }

  Future<void> deleteAdImages(AdModel model, int index) async {
    if (model.photos!.length <= 1) {
      Dialogs.toast('One Image Required Upload New Then Delete It');
      return;
    }

    try {
      Dialogs.loading();
      Map<String, String> imagesPathInStorage = {};
      List existedimges = model.photos!.values.toList();

      await Storage.deleteimage(existedimges[index]);
      existedimges.removeAt(index);
      for (var i = 0; i < existedimges.length; i++) {
        imagesPathInStorage.putIfAbsent('$i', () => existedimges[i]);
      }

      Database.updateAd(model.copyWith(photos: imagesPathInStorage), []);
    } catch (e) {
    } finally {
      Dialogs.closeLoading();
    }
  }

  Future<void> adImagesInAd(AdModel model) async {
    if (model.photos!.length >= 8) {
      Dialogs.toast('You Can Upload Maximum 8 images');
      return;
    }

    try {
      List existedimges = model.photos!.values.toList();
      Map<String, String> imagesPathInStorage = {};
      XFile? _userimage = await PickImage.pickImage();
      Dialogs.loading();
      String? pathinstorage = await Storage.uploadPostImages(
          pickedFile: _userimage!, uid: _authController.currentUser!.uid);
      existedimges.add(pathinstorage);
      for (var i = 0; i < existedimges.length; i++) {
        imagesPathInStorage.putIfAbsent('$i', () => existedimges[i]);
      }
      await Database.updateAd(model.copyWith(photos: imagesPathInStorage), []);
    } catch (e) {
      Dialogs.errorDialog('UnKnown Error');
    } finally {
      Dialogs.closeLoading();
    }
  }

  void deleteAd(AdModel model) {
    for (var i = 0; i < model.photos!.length; i++) {
      Storage.deleteimage(model.photos!['$i']);
    }
    Database.deleteMyad(model.docId!);
  }

  void pickImagesFormDevice() async {
    try {
      if (pickedImages.value.length >= 8) {
        return Dialogs.toast('You Can Post Maximum 8 Images');
      } else {
        XFile? _image = await PickImage.pickImage();
        pickedImages.update((val) {
          val!.add(_image!);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
