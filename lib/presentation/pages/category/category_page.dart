import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/ad.dart';
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
      body: FutureBuilder<List<AdModel>>(
          future: _databaseController.fetchCategory(args),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('No items'));
              } else
                return StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: getValueForScreenType(
                      context: context, mobile: 4, tablet: 8, desktop: 12),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, 2.5),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Get.toNamed(AdDetailPage.routeName,
                            arguments: snapshot.data![index]);
                      },
                      child: SizedBox(
                          child: AdWidget(adModel: snapshot.data![index]))),
                );
            } else {
              return Center(
                child: Text('loading'),
              );
            }
          }),
    );
  }
}
