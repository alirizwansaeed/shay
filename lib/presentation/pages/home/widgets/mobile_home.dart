import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/home/widgets/mobile_user_account.dart';
import 'package:shay/presentation/pages/pages.dart';

// ignore: must_be_immutable
class MobileHome extends StatelessWidget {
  final _authenticationController = Get.find<AuthenticationController>();
  final _pagecontroller = PageController();
  var bottomBarIndex = 0.obs;
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

  PageView _mobilehome() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pagecontroller,
      children: [
        Container(
          child: Text('1'),
        ),
        Container(
          child: Text('2'),
        ),
        Container(
          child: Text('3'),
        ),
       MobileUserAccount()
      ],
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Colors.black,
      child: Icon(
        Icons.add,
        size: 40,
      ),
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
    );
  }

  Widget _mobilebottombar() {
    return Obx(
      () => AnimatedBottomNavigationBar(
        inactiveColor: Colors.grey.shade600,
        splashColor: Colors.pink,
        icons: [
          Icons.home,
          Icons.book,
          Icons.favorite_border,
          Icons.manage_accounts
        ],
        activeIndex: bottomBarIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          bottomBarIndex(index);

          _pagecontroller.jumpToPage(index);
        },
      ),
    );
  }
}
