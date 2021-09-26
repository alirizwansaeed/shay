import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/pages.dart';

class DesktopTabletAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 50);
  final _authenticationController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: ScreenConstants.devicePadding),
            child: Image.asset(Assets.logo),
          ),
          leadingWidth: 120,
          backgroundColor: ColorConstants.primaryColor,
          actions: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 140, top: 5, bottom: 2),
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText:
                        'search mobile, Home utilities, cloting, and more',
                    suffix:
                        ElevatedButton(onPressed: () {}, child: Text('SEARCH')),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Obx(
              () => TextButton(
                onPressed: loginButton,
                child: Text(
                  _authenticationController.currentUserState == null
                      ? 'Login'
                      : 'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: ElevatedButton(
                  onPressed: sellButton,
                  child: Text(
                    'Sell',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              PopupMenuButton(
                child: Text(
                  'ALL CATEGORIES',
                ),
                tooltip: 'ALL CATEGORIES',
                itemBuilder: (context) => PostNewAdConstants.categoryMap.keys
                    .map((e) => PopupMenuItem(
                        height: 30,
                        textStyle: TextStyle(fontSize: 14),
                        value: e,
                        child: Text(e)))
                    .toList(),
              ),
              Spacer(),
              TextButton(onPressed: () {}, child: Text('MOBILE SHOPS')),
              SizedBox(width: 8),
              TextButton(onPressed: () {}, child: Text('LAPTOP SHOPS')),
              SizedBox(width: 8),
              TextButton(onPressed: () {}, child: Text('BECOME VENDOR')),
              SizedBox(width: 8),
              TextButton(onPressed: () {}, child: Text('PRICE PLANS')),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }

  void loginButton() {
    _authenticationController.currentUserState == null
        ? Get.toNamed(LoginPage.routeName)
        : _authenticationController.signOut();
  }

  void sellButton() async {
    if (_authenticationController.currentUserState == null)
      return Get.toNamed(LoginPage.routeName);
    if (_authenticationController.currentUserState != null &&
        await _authenticationController.isEmailVerified())
      return Get.toNamed(PostNewAdPage.routeName);
    if (_authenticationController.currentUserState != null &&
        !await _authenticationController.isEmailVerified())
      return Get.toNamed(UserVerificationPage.routeName);
    else
      return Get.toNamed(PostNewAdPage.routeName);
  }
}
