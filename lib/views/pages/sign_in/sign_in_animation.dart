import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shay/constants/constants.dart';

class SignInAnimation extends StatelessWidget {
  const SignInAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      AssetsAnimations.auth,
    );
  }
}
