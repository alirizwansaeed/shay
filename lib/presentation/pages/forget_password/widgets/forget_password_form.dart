import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/controllers/authentication.dart';

class ForgetPasswordForm extends StatelessWidget {
  final TextEditingController forgetEmailAddressController;
  const ForgetPasswordForm({
    Key? key,
    required this.forgetEmailAddressController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Column(
        children: [
          Text(
            'Enter your email address below and we’ll send you a link to reset your password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Neumorphic(
            child: TextField(
              enabled: true,
              controller: forgetEmailAddressController,
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(Icons.email),
                ),
                hintText: 'Enter your Email',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Neumorphic(
            style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(0))),
            child: ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text(
                'Send password',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                      context: context, mobile: 16.sp, desktop: 16, tablet: 16),
                ),
              ),
              onPressed: () {
                Get.find<AuthenticationController>()
                    .resetPassword(email: forgetEmailAddressController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
