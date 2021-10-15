import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/database.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/dialogs.dart';
import 'package:shay/utils/pick_image.dart';

class UserController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  var _currentUserStream = UserModel().obs;
  Rx<List<AdModel>> _currentUserAds = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _likedAds = Rx<List<AdModel>>([]);
  Rx<List<PackageModel>> _activePackagesStream = Rx<List<PackageModel>>([]);
  Rx<List<PackageModel>> _expirePackagesStream = Rx<List<PackageModel>>([]);
  Rx<List<XFile>> pickedImages = Rx<List<XFile>>([]);

  List<AdModel> get allAds {
    return _currentUserAds.value;
  }

  List<AdModel> get likedAds {
    return _likedAds.value;
  }

  String get uid {
    return _authController.currentUser!.uid;
  }

  List<PackageModel> get availablePackagesStream {
    return _activePackagesStream.value.where(
      (element) {
        return (element.remainingAdsLimit! > 0);
      },
    ).toList();
  }

  List<PackageModel> get activePackageStream {
    return _activePackagesStream.value;
  }

  List<PackageModel> get expirePackageStream {
    return _expirePackagesStream.value;
  }

  UserModel get currentUserStream {
    return _currentUserStream.value;
  }

  @override
  void onInit() async {
    _activePackagesStream.bindStream(Database.activePackageStream(uid));
    _currentUserStream.bindStream(Database.currentuserStream(uid));
    _currentUserAds.bindStream(Database.currentUserAdsStream(uid));
    _expirePackagesStream.bindStream(Database.expirePackageStream(uid));
    _likedAds.bindStream(Database.likedAdsStream(uid));

    super.onInit();
  }

  Future<void> likeAd({required String docid, required bool isliked}) async {
    await Database.likeAd(
        docid: docid, uid: _authController.currentUser!.uid, isliked: isliked);
  }

  void updateUser(UserModel userModel) async {
    try {
      Dialogs.loading();
      await Database.updateUser(
          userModel.copyWith(uid: _authController.currentUser!.uid));
      Dialogs.closeLoading();
      Get.back();
    } catch (e) {
      Dialogs.errorDialog('Unknown Erroe');
    } finally {
      Dialogs.closeLoading();
    }
  }

  Future<void> changeProfilePicture() async {
    try {
      XFile? pickimage = await PickImage.pickProfilePicture();
      BotToast.showLoading(backButtonBehavior: BackButtonBehavior.ignore);
      String imageurl = await Storage.changeProfilePicture(
          pickedFile: pickimage!, uid: _authController.currentUser!.uid);

      Database.updateUser(UserModel(
          uid: _authController.currentUser!.uid, profilePicture: imageurl));
    } catch (e) {
    } finally {
      BotToast.closeAllLoading();
    }
  }

  Future<void> addPackage(PackageModel model) async {
    try {
      Database.addPackage(
          model.copyWith(uid: _authController.currentUser!.uid));
    } catch (e) {
      print(e);
    }
  }
}
