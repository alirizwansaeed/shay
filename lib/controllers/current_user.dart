import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/database.dart';

class UserController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  var _currentUserStream = UserModel().obs;

  UserModel get currentUserStream {
    return _currentUserStream.value;
  }

  @override
  void onInit() async {
    _currentUserStream.bindStream(
        Database.currentuserStream(_authController.currentUser!.uid));

    super.onInit();
  }
}
