import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/home/widgets/mobile/pages/liked_ads_page_view/liked_ads_page_view.dart';
import 'package:shay/presentation/pages/my_ads/my_ads.dart';
import 'package:shay/presentation/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    HomePage.routeName: (context) => HomePage(),
    LoginPage.routeName: (context) => LoginPage(),
    SignUpPage.routeName: (context) => SignUpPage(),
    PostAdCategoryPage.routeName: (context) => PostAdCategoryPage(),
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
    ChoosePakagePage.routeName: (context) => ChoosePakagePage(),
    MyAds.routeName: (context) => MyAds(),
    LikedAdsPageView.routeName:(context)=>LikedAdsPageView()
  };
}
