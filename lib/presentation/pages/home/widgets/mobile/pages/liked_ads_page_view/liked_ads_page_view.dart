import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/ad_detail/ad_detail_page.dart';
import 'package:responsive_builder/src/helpers.dart';

class LikedAdsPageView extends StatelessWidget {
  static const routeName = 'likedads';
  final _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(title: "Liked Ads"),
      body: Obx(
        () => StaggeredGridView.countBuilder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: getValueForScreenType(
              context: context, mobile: 4, tablet: 8, desktop: 12),
          staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.5),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: _userController.likedAds.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Get.toNamed(AdDetailPage.routeName,
                    arguments: _userController.likedAds[index]);
              },
              child: SizedBox(
                  child: AdWidget(adModel: _userController.likedAds[index]))),
        ),
      ),
    );
  }
}
