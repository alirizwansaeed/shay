import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/pages.dart';

class DesktopTabletAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 40);

  @override
  Widget build(BuildContext context) {
    final _authenticationController = Get.find<AuthenticationController>();

    return Column(
      children: [
        AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: ScreenConstants.devicePadding),
            child: Image.asset(AssetsIconsConstants.logo),
          ),
          leadingWidth: 120,
          backgroundColor: CustomColorsConstants.appbarcolor,
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
            TextButton(
              onPressed: loginButton,
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 18,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: ElevatedButton(
                  onPressed: () {
                    Get.find<AuthenticationController>().signOut();
                  },
                  child: Text(
                    'Sell',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                  )),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: ScreenConstants.devicePadding),
        //   child: Container(
        //     height: 40,
        //     child: Wrap(
        //       children: [
        //         Text('CATEGORIES'),
        //         Spacer(),
        //         Text('MOBILE SHOPS'),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text('LAPTOPSHOPS'),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text('BECOME A VENDOR'),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text('EXPLORE ADS'),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text('PRICING PLANS'),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  void loginButton() {
    Get.toNamed(LoginPage.routeName);
  }

  void sellButton() {}
}
