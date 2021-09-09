import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DesktopAppbar(),
        body: ScreenTypeLayout.builder(
            mobile: (_) => Container(), desktop: (_) => Container()));
  }
}
