import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/ad_widget.dart';
import 'package:shay/presentation/pages/pages.dart';

class FeatureAdsListView extends StatelessWidget {
  final _databseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.only(left: 8),
          scrollDirection: Axis.horizontal,
          itemCount: _databseController.featuredAdsStream.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.toNamed(AdDetailPage.routeName,
                  arguments: _databseController.featuredAdsStream[index]);
            },
            child: SizedBox(
              width: 180,
              child: AdWidget(adModel: _databseController.featuredAdsStream[index]),
            ),
          ),
        ),
      ),
    );
  }
}
