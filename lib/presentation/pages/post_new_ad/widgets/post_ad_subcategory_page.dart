import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/post_new_ad/post_new_ad_page.dart';

class PostAdSubcategoryPage extends StatelessWidget {
  final CategoryModel model;
  const PostAdSubcategoryPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Choose SubCategory",
      ),
      body: model.subCategory.isEmpty
          ? customTile(
              onTap: () {
                Get.to(
                    () => PostNewAdPage(category: model.name, subCategory: ''));
              },
              title: 'Next')
          : ListView.builder(
              itemCount: model.subCategory.length,
              itemBuilder: (context, index) => customTile(
                  onTap: () {
                    Get.to(
                      () => PostNewAdPage(
                        category: model.name,
                        subCategory: model.subCategory[index],
                      ),
                    );
                  },
                  title: model.subCategory[index]),
            ),
    );
  }
}
