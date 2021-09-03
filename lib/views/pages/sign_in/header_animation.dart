import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shay/constants/constants.dart';

class HeaderAnimation extends StatelessWidget {
  const HeaderAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      AssetsAnimations.auth,
    );
  }
}
