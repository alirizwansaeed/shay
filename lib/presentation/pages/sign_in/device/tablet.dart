import 'package:flutter/material.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/presentation/common_widgets/Custom_appbar.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../sign_in.dart';

class Tablet extends StatelessWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appBar(context, title: Text('Sign in')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40.w - ScreenConstraints.devicePadding,
                  child: AuthAnimation(),
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
