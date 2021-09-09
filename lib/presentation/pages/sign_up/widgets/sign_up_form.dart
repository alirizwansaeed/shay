import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:shay/controllers/authentication.dart';
import 'package:shay/utils/utils.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailAddressController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Rx<bool> passwordVisibility;
  final Rx<bool> confirmpasswordVisibilty;
  const SignUpForm({
    Key? key,
    required this.usernameController,
    required this.emailAddressController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordVisibility,
    required this.confirmpasswordVisibilty,
  }) : super(key: key);

  void signUPButtom() {
    comparePassword(
            password: passwordController.text,
            comfirmPassword: confirmPasswordController.text)
        ? Get.find<AuthenticationController>().createUserWithEmailPassword(
            userName: usernameController.text,
            email: emailAddressController.text,
            password: passwordController.text)
        : Get.showSnackbar(GetBar(
            duration: const Duration(seconds: 2),
            titleText: SizedBox.shrink(),
            message: 'password not match',
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Neumorphic(
          style: NeumorphicStyle(color: Color(0xFFCCEAF5)),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(Icons.person),
              ),
              hintText: 'User name',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 3.h, desktop: 20, tablet: 3.h),
        ),
        Neumorphic(
          style: NeumorphicStyle(color: Color(0xFFCCEAF5)),
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
            style: NeumorphicStyle(color: Color(0xFFCCEAF5)),
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
              context: context, mobile: 3.h, desktop: 20, tablet: 3.h),
        ),
        Obx(
          () => Neumorphic(
            style: NeumorphicStyle(color: Color(0xFFCCEAF5)),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: confirmpasswordVisibilty.value ? false : true,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () => confirmpasswordVisibilty.toggle(),
                  child: Icon(
                    confirmpasswordVisibilty.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(Icons.lock),
                ),
                hintText: 'Confirm password',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 6.h, desktop: 30, tablet: 6.h),
        ),
        Align(
          alignment: Alignment.center,
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(0))),
            child: ElevatedButton.icon(
              onPressed: () => signUPButtom(),
              icon: Icon(Icons.login),
              label: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                      context: context, mobile: 16.sp, desktop: 16, tablet: 16),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getValueForScreenType(
              context: context, mobile: 2.h, desktop: 20, tablet: 3.h),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: getValueForScreenType(
                  context: context, mobile: 16.sp, tablet: 16, desktop: 16),
            ),
          ),
        )
      ],
    );
  }
}
