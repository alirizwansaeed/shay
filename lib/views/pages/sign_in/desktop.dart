import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/constants/constants.dart';

import 'sign_in.dart';

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);

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
                width: 50.w - ScreenConstraints.devicePadding,
                child: HeaderAnimation(),
              ),
              SizedBox(
                width: 40.w - ScreenConstraints.devicePadding,
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
