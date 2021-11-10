import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

import '../pages.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _databaseController = Get.find<DatabaseController>();
  @override
  void initState() {
    _databaseController.searchedAds.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        actions: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 3, right: 10, left: 50),
            child: TextField(
              decoration: formFieldDecoration.copyWith(
                hintText: 'search mobile, Home utilities, cloting, and more',
              ),
              onChanged: (value) {
                _databaseController.searchads(value);
              },
            ),
          ))
        ],
      ),
      body: Obx(
        () => StaggeredGridView.countBuilder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: getValueForScreenType(
              context: context, mobile: 4, tablet: 8, desktop: 12),
          staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.7),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: _databaseController.searchedAds.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Get.toNamed(AdDetailPage.routeName,
                    arguments: _databaseController.searchedAds[index]);
              },
              child: SizedBox(
                  child: AdWidget(
                      adModel: _databaseController.searchedAds[index]))),
        ),
      ),
    );
  }
}
