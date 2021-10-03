import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';

import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../pages.dart';

class SpecificUserAdsPage extends StatelessWidget {
  static const routeName = 'adsbyuser';
  final _databaseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: MobileAppbar(title: args,),
      body: Obx(
        () => _databaseController.fetchedSpecificUserAdsList.isEmpty
            ? Center(
                child: Text('Loading'),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerText('Published Ads'),
                    StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(2, 2.5),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      itemCount:
                          _databaseController.fetchedSpecificUserAdsList.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Get.toNamed(AdDetailPage.routeName,
                              arguments: _databaseController
                                  .fetchedSpecificUserAdsList[index]);
                        },
                        child: AdWidget(
                          adModel: _databaseController
                              .fetchedSpecificUserAdsList[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
