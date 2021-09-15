import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/pages/pages.dart';

class MobileUserAccount extends StatelessWidget {
  MobileUserAccount({Key? key}) : super(key: key);
  final _authenticationController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _authenticationController.currentUserState == null
              ? TextButton(
                  onPressed: () async {
                    if (_authenticationController.currentUserState == null)
                      return Get.toNamed(LoginPage.routeName);
                    if (await _authenticationController.isEmailVerified())
                      return Get.toNamed(PostNewAdPage.routeName);
                    if (!await _authenticationController.isEmailVerified())
                      return Get.toNamed(UserVerificationPage.routeName);
                    else
                      return Get.toNamed(PostNewAdPage.routeName);
                  },
                  child: Text('Login'))
              : TextButton(
                  onPressed: () {
                    _authenticationController.signOut();
                  },
                  child: Text("Sign out")),
        ],
      ),
    );
  }
}
