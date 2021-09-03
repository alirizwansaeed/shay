import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'sign_in.dart';

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
          child: HeaderAnimation(),
        ),
        SignInForm()
      ],
    );
  }
}
