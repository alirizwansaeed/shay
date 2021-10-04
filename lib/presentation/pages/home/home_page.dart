import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/home/widgets/desktop_tablet/desktop_tab_home.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/mobile_home.dart';
import 'package:shay/utils/utils.dart';
import 'package:get/get.dart';

import '../pages.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  static const routeName = 'home';

  final _pagecontroller = PageController();
  var bottomBarIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    print('ali');
    return

     screenType(context,
        mobile: MobileHome(
          pageController: _pagecontroller,
          bottombarIndex: bottomBarIndex,
        ),
        desktopTab: DesktopTabHome());
  }
}
