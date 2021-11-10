import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/pages/liked_ads_page_view/liked_ads_page_view.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/pages/my_ads_page_view/my_ads_page_view.dart';
import 'package:shay/presentation/pages/my_ads/my_ads.dart';
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
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(SearchPage.routeName);
                  },
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText:
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
            ),
            SizedBox(width: 10),
            Obx(
              () => _authenticationController.currentUserState == null
                  ? TextButton(
                      onPressed: loginButton,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Edit Profile'),
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Get.toNamed(EditUserProfilepage.routeName);
                          },
                        ),
                        PopupMenuItem(
                            child: Text('Packages'),
                            onTap: () async {
                              await Future.delayed(Duration.zero);
                              Get.toNamed(ChoosePakagePage.routeName);
                            }),
                        PopupMenuItem(
                          child: Text('My Ads'),
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Get.toNamed(MyAds.routeName);
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Liked Ads'),
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Get.toNamed(LikedAdsPageView.routeName);
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Setting'),
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Get.toNamed(SettingsPage.routeName);
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Logout'),
                          onTap: () =>
                              Get.find<AuthenticationController>().signOut(),
                        )
                      ],
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Text(
                              '${Get.find<UserController>().currentUserStream.displayName}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(Icons.expand_more, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: ElevatedButton(
                  onPressed: sellButton,
                  child: Text(
                    'Post new ad',
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
                        onTap: () async {
                          await Future.delayed(Duration.zero);
                          Get.toNamed(CategoryPage.routeName, arguments: e);
                        },
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
      return Get.toNamed(PostAdCategoryPage.routeName);
    if (_authenticationController.currentUserState != null &&
        !await _authenticationController.isEmailVerified())
      return Get.toNamed(UserVerificationPage.routeName);
    else
      return Get.toNamed(PostAdCategoryPage.routeName);
  }
}
