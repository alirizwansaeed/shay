import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenType(context,
          mobile: MobileAppbar(), desktopTab: DesktopTabletAppbar()),
      body: SingleChildScrollView(),
    );
  }
}
