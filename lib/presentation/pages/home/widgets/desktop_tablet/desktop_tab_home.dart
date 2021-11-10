import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/home/widgets/feature_ads_listView.dart';

import '../../../pages.dart';

class DesktopTabHome extends StatelessWidget {
  DesktopTabHome({Key? key}) : super(key: key);
  final _databseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopTabletAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenConstants.devicePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerText(
                    'Featured Ads',
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(FeaturedAdsPage.routeName);
                    },
                    child: Text('VIEW ALL'),
                  )
                ],
              ),
              SizedBox(height: 10),
              FeatureAdsListView(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: headerText('All Ads'),
              ),
              Obx(
                () => StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: getValueForScreenType(
                      context: context, mobile: 4, tablet: 8, desktop: 12),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, 2.7),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemCount: _databseController.allAdsStream.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Get.toNamed(AdDetailPage.routeName,
                            arguments: _databseController.allAdsStream[index]);
                      },
                      child: SizedBox(
                          child: AdWidget(
                              adModel:
                                  _databseController.allAdsStream[index]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
