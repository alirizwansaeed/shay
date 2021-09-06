import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              context: context, mobile: 1.h, desktop: 20, tablet: 4.h),
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
                context: context, mobile: 3.h, desktop: 20, tablet: 8.h)),
        Align(
          alignment: Alignment.center,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.login),
            label: Text(
              'Sign in',
              style: TextStyle(
                fontSize: getValueForScreenType(
                    context: context, mobile: 16.sp, desktop: 16, tablet: 16),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 1.h, desktop: 20, tablet: 4.h),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'or',
            style: TextStyle(
              fontSize: getValueForScreenType(
                  context: context, mobile: 14.sp, desktop: 16, tablet: 16),
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 2.h, desktop: 20, tablet: 4.h),
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(AssetsIcons.google)),
              VerticalDivider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.0,
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AssetsIcons.facebook,
                    height: 25,
                  )),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
                thickness: 1.0,
              ),
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(AssetsIcons.apple)),
            ],
          ),
        ),
        SizedBox(
            height: getValueForScreenType(
                context: context, mobile: 3.h, desktop: 50, tablet: 8.h)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign up',
              style: TextStyle(
                  fontSize: getValueForScreenType(
                      context: context, mobile: 16.sp, desktop: 16, tablet: 16),
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forget password?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: getValueForScreenType(
                    context: context, mobile: 14.sp, desktop: 15, tablet: 15),
              ),
            ),
          ),
        ])
      ],
    );
  }
}
