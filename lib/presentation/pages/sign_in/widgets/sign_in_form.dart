import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/pages/pages.dart';

/// sign in form
class SignInForm extends StatelessWidget {
  final TextEditingController emailAddressController;
  final TextEditingController passwordController;
  final Rx<bool> passwordVisibility;
  const SignInForm({
    Key? key,
    required this.emailAddressController,
    required this.passwordController,
    required this.passwordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Neumorphic(
          child: TextField(
            controller: emailAddressController,
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(Icons.email),
              ),
              hintText: 'Email Address',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 3.h, desktop: 20, tablet: 3.h),
        ),
        Obx(
          () => Neumorphic(
            child: TextField(
              controller: passwordController,
              obscureText: passwordVisibility.value ? false : true,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => passwordVisibility.toggle(),
                  child: Icon(
                    passwordVisibility.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(Icons.lock),
                ),
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
            height: getValueForScreenType(
                context: context, mobile: 6.h, desktop: 20, tablet: 8.h)),
        Align(
          alignment: Alignment.center,
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(0))),
            child: ElevatedButton.icon(
              label: Text(
                'Sign in',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                      context: context, mobile: 16.sp, desktop: 16, tablet: 16),
                ),
              ),
              icon: Icon(Icons.login),
              onPressed: () {
                Get.find<AuthenticationController>().signInWithEmailPassword(
                    email: emailAddressController.text,
                    password: passwordController.text);
              },
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 4.h, desktop: 30, tablet: 4.h),
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'or',
              style: TextStyle(
                fontSize: getValueForScreenType(
                    context: context, mobile: 15.sp, desktop: 14, tablet: 14),
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Divider(
                color: Colors.red,
              ),
            )
          ],
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 6.h, desktop: 30, tablet: 4.h),
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Neumorphic(
                child: IconButton(
                  onPressed: () =>
                      Get.find<AuthenticationController>().signInWithGoogle(),
                  icon: SvgPicture.asset(
                    AssetsIcons.google,
                  ),
                ),
              ),
              VerticalDivider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.0,
              ),
              Neumorphic(
                child: IconButton(
                    onPressed: () {
                      Get.find<AuthenticationController>().signInWithFacebook();
                    },
                    icon: SvgPicture.asset(
                      AssetsIcons.facebook,
                      height: 25,
                    )),
              ),
              VerticalDivider(
                indent: 10,
                endIndent: 10,
                thickness: 1.0,
              ),
              Neumorphic(
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AssetsIcons.apple)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 6.h, desktop: 50, tablet: 8.h),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
            onPressed: () {
              Get.toNamed(SignUpPage.routeName);
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                  fontSize: getValueForScreenType(
                      context: context, mobile: 16.sp, desktop: 16, tablet: 16),
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(ForgetPasswordPage.routeName);
            },
            child: Text(
              'Forget password?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: getValueForScreenType(
                    context: context, mobile: 15.sp, desktop: 15, tablet: 15),
              ),
            ),
          ),
        ])
      ],
    );
  }
}
