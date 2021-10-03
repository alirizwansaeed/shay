import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/ad_widget.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/pages.dart';

class FeaturedAdsPage extends StatelessWidget {
  static const routeName = 'featuredads';

  const FeaturedAdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databseController = Get.find<DatabaseController>();
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Featured Ads',
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.5),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: _databseController.featuredAdsStream.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            Get.toNamed(
              AdDetailPage.routeName,
              arguments: _databseController.featuredAdsStream[index]);
          },
          child: AdWidget(
            adModel: _databseController.featuredAdsStream[index],
          ),
        ),
      ),
    );
  }
}
