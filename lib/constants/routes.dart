import 'package:flutter/material.dart';
import 'package:shay/views/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    HomePage.routeName:(context) => HomePage(),
    SignInPage.routeName: (context) => SignInPage(),
    SignUpPage.routeName:(context) => SignUpPage(),
    PostAdPage.routeName:(context) => PostAdPage(),

  };
}
