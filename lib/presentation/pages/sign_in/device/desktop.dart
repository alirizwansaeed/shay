import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/Custom_appbar.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../sign_in.dart';

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appBar(context, title: Text('Sign in')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.w - ScreenConstraints.devicePadding,
                  height: 600,
                  child: AuthAnimation(),
                ),
                SizedBox(
                  width: 40.w - ScreenConstraints.devicePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
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
