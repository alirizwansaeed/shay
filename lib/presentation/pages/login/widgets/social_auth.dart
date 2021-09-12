import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shay/constants/constants.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetsIconsConstants.google,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetsIconsConstants.facebook,
              height: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIconsConstants.apple)),
      ],
    );
  }
}
