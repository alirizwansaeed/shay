import 'package:flutter/material.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/my_ads/my_ads.dart';

class MyAdsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'My Ads',
      ),
      body: MyAds(),
    );
  }
}
