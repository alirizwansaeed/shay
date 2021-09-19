import 'package:flutter/material.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/home/widgets/feature_ads_listView.dart';

class DesktopTabHome extends StatelessWidget {
  const DesktopTabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopTabletAppbar(),
      body: Padding(
        padding: EdgeInsets.all(ScreenConstants.devicePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Featured Ads",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 10),
            FeatureAdsListView(),
          ],
        ),
      ),
    );
  }
}
