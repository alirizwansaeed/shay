import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// sign in form
class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Email Address',
            fillColor: Colors.grey.shade200,
            filled: true,
            border: InputBorder.none,
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 1.h, desktop: 4.h, tablet: 4.h),
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Password',
            fillColor: Colors.grey.shade200,
            filled: true,
            border: InputBorder.none,
          ),
        ),
        SizedBox(
            height: getValueForScreenType(
                context: context, mobile: 3.h, desktop: 8.h, tablet: 8.h)),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.login),
            label: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 1.h, desktop: 4.h, tablet: 4.h),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'or',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 2.h, desktop: 4.h, tablet: 4.h),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 8.h, desktop: 15.h, tablet: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AssetsIcons.google,
                ),
              ),
              VerticalDivider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.0,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AssetsIcons.facebook,
                ),
              ),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
                thickness: 1.0,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AssetsIcons.apple,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign up',
              style: TextStyle(
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forget password?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ])
      ],
    );
  }
}
