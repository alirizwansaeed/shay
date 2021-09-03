import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/constants.dart';
import 'views/pages/pages.dart';
void main() {
  runApp(
    Myapp(), // Wrap your app
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SignInPage.routeName,
        routes: Routes.routes,
      ),
    );
  }
}
