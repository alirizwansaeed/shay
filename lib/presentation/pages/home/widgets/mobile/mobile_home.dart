import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/pages/liked_ads_page_view/liked_ads_page_view.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/pages/user_account_page/mobile_user_account.dart';
import 'package:shay/presentation/pages/pages.dart';

import 'pages/home_page_view/home_page_view.dart';
import 'pages/my_ads_page_view/my_ads_page_view.dart';

// ignore: must_be_immutable
class MobileHome extends StatelessWidget {
  final PageController pageController;
  final Rx<int> bottombarIndex;
  MobileHome({
    Key? key,
    required this.pageController,
    required this.bottombarIndex,
  }) : super(key: key);

  final _authenticationController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _mobilebottombar(),
      body: SafeArea(child: _mobilehome()),
    );
  }

  Widget _mobilehome() {
    return Obx(
      () => PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePageView(),
          _authenticationController.currentUserState == null
              ? LoginPage()
              : MyAdsPageView(),
          _authenticationController.currentUserState == null
              ? LoginPage()
              : LikedAdsPageView(),
          MobileUserAccount()
        ],
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 40,
      ),
      onPressed: () async {
        if (_authenticationController.currentUserState == null)
          return Get.toNamed(LoginPage.routeName);
        if (!await _authenticationController.isEmailVerified())
          return Get.toNamed(UserVerificationPage.routeName);
        else
          return Get.toNamed(PostNewAdPage.routeName);
      },
    );
  }

  Widget _mobilebottombar() {
    return Obx(
      () => AnimatedBottomNavigationBar(
        inactiveColor: Colors.pink.shade200,
        splashColor: Colors.pink,
        activeColor: Colors.pink,
        notchMargin: 5.0,
        icons: [
          Icons.home,
          Icons.book,
          Icons.favorite_border,
          Icons.manage_accounts
        ],
        activeIndex: bottombarIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          bottombarIndex(index);

          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
