import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<DatabaseController>(DatabaseController());
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
