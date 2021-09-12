import 'package:get/get.dart';
import 'package:shay/controllers/database.dart';
import 'package:shay/controllers/authentication.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.lazyPut(() => DatabaseController());
  }
}
