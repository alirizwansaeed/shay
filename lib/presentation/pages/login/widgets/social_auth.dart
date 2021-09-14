import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';

class SocialAuth extends StatelessWidget {
 SocialAuth({Key? key}) : super(key: key);
 final _authenticationController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed:_authenticationController.isLoading.value?null:
               () {
                 Get.find<AuthenticationController>().signInWithGoogle();
              },
              icon: SvgPicture.asset(
                AssetsIconsConstants.google,
              )),
          IconButton(
              onPressed: _authenticationController.isLoading.value?null:() {
                Get.find<AuthenticationController>().signInWithFacebook();
              },
              icon: SvgPicture.asset(
                AssetsIconsConstants.facebook,
                height: 25,
              )),
          IconButton(
            onPressed:_authenticationController.isLoading.value?null: () {},
            icon: SvgPicture.asset(AssetsIconsConstants.apple),
          ),
        ],
      ),
    );
  }
}
