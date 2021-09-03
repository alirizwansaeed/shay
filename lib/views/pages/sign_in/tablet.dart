import 'package:flutter/material.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'sign_in.dart';

class Tablet extends StatelessWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Placeholder(
          fallbackHeight: 10.h,
          fallbackWidth: 100.w,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 40.w - ScreenConstraints.devicePadding,
                child: HeaderAnimation(),
              ),
              SizedBox(
                width: 60.w - ScreenConstraints.devicePadding,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    SignInForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
