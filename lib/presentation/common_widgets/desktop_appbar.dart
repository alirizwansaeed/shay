import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/pages/pages.dart';

class DesktopAppbar extends StatefulWidget implements PreferredSizeWidget {
  const DesktopAppbar({Key? key}) : super(key: key);

  @override
  _DesktopAppbarState createState() => _DesktopAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 40);
}

class _DesktopAppbarState extends State<DesktopAppbar> {
  @override
  Widget build(BuildContext context) {
    final _authenticationController = Get.find<AuthenticationController>();
    return Column(
      children: [
        Obx(
          () => AppBar(
            leading: Padding(
              padding:
                  const EdgeInsets.only(left: ScreenConstraints.devicePadding),
              child: Image.asset(AssetsIcons.logo),
            ),
            leadingWidth: 160,
            backgroundColor: CustomColors.appbarcolor,
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                    onPressed: () {
                      _authenticationController.currentUserId == null
                          ? Get.toNamed(SignInPage.routeName)
                          : Get.toNamed(PostAdPage.routeName);
                    },
                    child: Text('Sell')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 2),
                child: SizedBox(
                  width: 40.w,
                  child: TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      labelText:
                          'search mobile, Home utilities, cloting, and more',
                      suffix: ElevatedButton(
                          onPressed: () {}, child: Text('SEARCH')),
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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _authenticationController.currentUserId == null
                    ? ElevatedButton(
                        onPressed: () => Get.toNamed(SignInPage.routeName),
                        child: Text('Login'),
                      )
                    : ElevatedButton(
                        onPressed: () => _authenticationController.signOut(),
                        child: Text('Logout'),
                      ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ScreenConstraints.devicePadding),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text('CATEGORIES'),
                Spacer(),
                Text('MOBILE SHOPS'),
                SizedBox(
                  width: 10,
                ),
                Text('LAPTOPSHOPS'),
                SizedBox(
                  width: 10,
                ),
                Text('BECOME A VENDOR'),
                SizedBox(
                  width: 10,
                ),
                Text('EXPLORE ADS'),
                SizedBox(
                  width: 10,
                ),
                Text('PRICING PLANS'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
