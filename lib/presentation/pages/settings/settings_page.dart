import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/pages.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = 'settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Settings',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTile(
              onTap: () => Get.toNamed(ChangePasswordPage.routeName),
              title: 'Change Password',
              leading: Icons.password_outlined),

        ],
      ),
    );
  }
}
