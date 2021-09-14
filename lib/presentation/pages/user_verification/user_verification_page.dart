import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/screen_type.dart';

class UserVerificationPage extends StatelessWidget {
  static const routeName = 'userverification';
  const UserVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenType(context,
          mobile: MobileAppbar(), desktopTab: DesktopTabletAppbar()),
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          padding: EdgeInsets.all(10),
          width: getValueForScreenType<double>(
              context: context,
              mobile: Get.width - 30,
              tablet: 500,
              desktop: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Confirm your Verification",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'We send you verification link at'),
                TextSpan(
                    text:
                        ' ${Get.find<AuthenticationController>().currentUser!.email} ',
                    style: TextStyle(color: Colors.blue)),
                TextSpan(
                    text:
                        'In order to post ads kindly confirm your verification within 24 Hours'),
              ])),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Don't receive varification link?")),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: _resendVerificationButton,
                  child: Text('Resend Varification Email')),
            ],
          ),
        ),
      ),
    );
  }

  void _resendVerificationButton() {
    Get.find<AuthenticationController>().currentUser!.sendEmailVerification();
    Get.back();
  }
}
