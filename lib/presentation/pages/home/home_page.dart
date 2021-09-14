import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandabar/pandabar.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/home/widgets/mobile_bottombar.dart';
import 'package:shay/presentation/pages/pages.dart';
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
          mobile: MobileAppbar(
            actions: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, top: 1),
                  child: TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(right: 10, left: 10, bottom: 15),
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
            ],
          ),
          desktopTab: DesktopTabletAppbar()),
      bottomNavigationBar: screenType(
        context,
        mobile: MobileBottomBar()
      ),
    );
  }
}
