import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';

// ignore: must_be_immutable
class SocialAuth extends StatelessWidget {
  SocialAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: _googleButton,
            icon: SvgPicture.asset(
              Assets.google,
            )),
        IconButton(
            onPressed: _facebookButton,
            icon: SvgPicture.asset(
              Assets.facebook,
              height: 25,
            )),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.apple),
        ),
      ],
    );
  }

  _facebookButton() {
    Get.find<AuthenticationController>().signInWithFacebook();
  }

  _googleButton() async {
    await Get.find<AuthenticationController>().signInWithGoogle();
  }
}
