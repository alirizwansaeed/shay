import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';

// ignore: must_be_immutable
class SocialAuth extends StatelessWidget {
  SocialAuth({Key? key}) : super(key: key);
  final _authenticationController = Get.find<AuthenticationController>();
  var isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: _authenticationController.isLoading.value
                  ? null
                  : _googleButton,
              icon: SvgPicture.asset(
                Assets.google,
              )),
          IconButton(
              onPressed: _authenticationController.isLoading.value
                  ? null
                  : _facebookButton,
              icon: SvgPicture.asset(
                Assets.facebook,
                height: 25,
              )),
          IconButton(
            onPressed: _authenticationController.isLoading.value ? null : () {},
            icon: SvgPicture.asset(Assets.apple),
          ),
        ],
      ),
    );
  }

  _facebookButton() async {
    try {
      await Get.find<AuthenticationController>().signInWithFacebook();
      Get.back();
    } catch (e) {
      Get.snackbar('Login Failed', 'Try again');
    }
  }

  _googleButton() async {
    try {
      await Get.find<AuthenticationController>().signInWithGoogle();
      Get.back();
    } catch (e) {
      Get.snackbar('Login Failed', 'Try again');
    }
  }
}
