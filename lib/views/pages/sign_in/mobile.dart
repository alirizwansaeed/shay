import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/constants/constants.dart';

import 'sign_in.dart';

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
              child: SignInAnimation(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenConstraints.devicePadding),
              child: SignInForm(),
            )
          ],
        ),
      ),
    );
  }
}
