import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/home/widgets/desktop_tablet/desktop_tab_home.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/mobile_home.dart';
import 'package:shay/utils/utils.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return screenType(context,
        mobile: MobileHome(), desktopTab: DesktopTabHome());
  }


}
