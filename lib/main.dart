import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/constants.dart';
import 'views/pages/pages.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Myapp(), // Wrap your app
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder,
        initialRoute: SignInPage.routeName,
        routes: Routes.routes,
      ),
    );
  }
}
