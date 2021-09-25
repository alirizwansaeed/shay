import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                Get.find<AuthenticationController>().signOut();
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
