import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/database.dart';

class CurrentUserController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  var _currentUserStream = UserModel().obs;

  UserModel get currentUserStream {
    return _authController.currentUserState == null
        ? _currentUserStream(UserModel())
        : _currentUserStream.value;
  }

  @override
  void onInit() {
    if (_authController.currentUserState != null)
      _currentUserStream.bindStream(
          Database.currentuserStream(_authController.currentUser!.uid));
    super.onInit();
  }

  @override
  void onClose() {
    _currentUserStream.close();
    super.onClose();
  }
//   @override
//   void onReady() {

//     super.onReady();
//   }
//   @override

//   InternalFinalCallback<void> get onDelete => super.onDelete;

}
