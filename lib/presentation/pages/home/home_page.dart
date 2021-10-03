import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/home/widgets/desktop_tablet/desktop_tab_home.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/mobile_home.dart';
import 'package:shay/utils/utils.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pagecontroller = PageController();
  var bottomBarIndex = 0.obs;

  @override
  void initState() {
    _pagecontroller.addListener(() {
      if (_pagecontroller.page == 2||_pagecontroller.page==1) {


      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return screenType(context,
        mobile: MobileHome(
          pageController: _pagecontroller,
          bottombarIndex: bottomBarIndex,
        ),
        desktopTab: DesktopTabHome());
  }
}
