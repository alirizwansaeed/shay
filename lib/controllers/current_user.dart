import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/database.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/pick_image.dart';

class UserController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  var _currentUserStream = UserModel().obs;
  Rx<List<AdModel>> _currentUserAds = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _likedAds = Rx<List<AdModel>>([]);

  List<AdModel> get allAds {
    return _currentUserAds.value;
  }

  List<AdModel> get likedAds {
    return _likedAds.value;
  }

  UserModel get currentUserStream {
    return _currentUserStream.value;
  }

  @override
  void onInit() async {
    _currentUserStream.bindStream(
        Database.currentuserStream(_authController.currentUser!.uid));
    _currentUserAds.bindStream(
        Database.currentUserAdsStream(_authController.currentUser!.uid));
    _likedAds
        .bindStream(Database.likedAdsStream(_authController.currentUser!.uid));

    super.onInit();
  }

  void deleteAd(AdModel model) {
    for (var i = 0; i < model.photos!.length; i++) {
      Storage.deleteimage(model.photos!['$i']);
    }
    Database.deleteMyad(model.docId!);
  }

  Future<void> likeAd({required String docid, required bool isliked}) async {
    await Database.likeAd(
        docid: docid, uid: _authController.currentUser!.uid, isliked: isliked);
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
}
