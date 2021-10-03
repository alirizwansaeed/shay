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
    EditUserProfilepage.routeName: (context) => EditUserProfilepage(),
    AdDetailPage.routeName: (context) => AdDetailPage(),
    FeaturedAdsPage.routeName: (context) => FeaturedAdsPage(),
    HelpAndSupportPage.routeName: (context) => HelpAndSupportPage(),
    ContactUsPage.routeName: (context) => ContactUsPage(),
    HelpPage.routeName: (context) => HelpPage(),
    Faqspage.routeName: (context) => Faqspage(),
    AboutUspage.routeName: (context) => AboutUspage(),
    SettingsPage.routeName: (context) => SettingsPage(),
    ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
    WrapperPage.routeName: (context) => WrapperPage(),
    SpecificUserAdsPage.routeName: (context) => SpecificUserAdsPage(),
    EditAdPage.routeName: (context) => EditAdPage(),
    SearchPage.routeName: (context) => SearchPage(),
    CategoryPage.routeName: (context) => CategoryPage(),
  };
}
