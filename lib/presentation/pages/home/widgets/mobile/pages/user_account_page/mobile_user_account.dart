import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../../../../../pages.dart';

class MobileUserAccount extends StatelessWidget {
  MobileUserAccount({Key? key}) : super(key: key);
  final _authController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Obx(
          () => _authController.currentUserState == null
              ? SizedBox.shrink()
              : Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      backgroundImage: AssetImage(AssetsIconsConstants.avatar),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        Get.find<CurrentUserController>()
                                .currentUserStream
                                .displayName ??
                            'Shay User',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            Get.toNamed(EditUserProfilepage.routeName),
                        icon: Icon(Icons.edit))
                  ],
                ),
        ),
        SizedBox(
          height: 30,
        ),
        customTile(
            title: 'Settings',
            leading: Icons.settings,
            subTitle: 'Change password and logout',
            onTap: () => Get.toNamed(SettingsPage.routeName)),
        customTile(
            title: 'Help And Support',
            leading: Icons.help_center_outlined,
            subTitle: 'Contact Us, Help and FAQs ',
            onTap: () => Get.toNamed(HelpAndSupportPage.routeName)),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: _authController.currentUserState != null
                ? ElevatedButton(
                    onPressed: () {
                      _authController.signOut();
                    },
                    child: Text("Sign out"))
                : ElevatedButton(
                    onPressed: () async {
                      if (_authController.currentUserState == null)
                        return Get.toNamed(LoginPage.routeName);
                      if (await _authController.isEmailVerified())
                        return Get.toNamed(PostNewAdPage.routeName);
                      if (!await _authController.isEmailVerified())
                        return Get.toNamed(UserVerificationPage.routeName);
                      else
                        return Get.toNamed(PostNewAdPage.routeName);
                    },
                    child: Text('Login or Register'),
                  ),
          ),
        )
      ],
    );
  }
}
