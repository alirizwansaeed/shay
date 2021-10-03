import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../pages.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = 'category';
  final _databaseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: MobileAppbar(
        title: args,
      ),
      body: Obx(
        () => StaggeredGridView.countBuilder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.5),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: _databaseController.fetchedCategory.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Get.toNamed(AdDetailPage.routeName,
                    arguments: _databaseController.fetchedCategory[index]);
              },
              child: SizedBox(
                  child: AdWidget(
                      adModel: _databaseController.fetchedCategory[index]))),
        ),
      ),
    );
  }
}
