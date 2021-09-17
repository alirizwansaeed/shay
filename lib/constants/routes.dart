import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    HomePage.routeName: (context) => HomePage(),
    LoginPage.routeName: (context) => LoginPage(),
    SignUpPage.routeName: (context) => SignUpPage(),
    PostNewAdPage.routeName: (context) => PostNewAdPage(),
    ForgetPasswordPage.routeName: (context) => ForgetPasswordPage(),
    UserVerificationPage.routeName: (context) => UserVerificationPage(),
    EditProfilePage.routeName: (context) => EditProfilePage(),
  };
}
