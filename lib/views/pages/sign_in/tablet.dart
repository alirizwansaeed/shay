import 'package:flutter/material.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'sign_in.dart';

class Tablet extends StatelessWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shay'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40.w - ScreenConstraints.devicePadding,
                  child: SignInAnimation(),
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
          ],
        ),
      ),
    );
  }
}
