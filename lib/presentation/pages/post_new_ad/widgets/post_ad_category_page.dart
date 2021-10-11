import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/post_new_ad/widgets/post_ad_subcategory_page.dart';

class PostAdCategoryPage extends StatelessWidget {
  static const routeName = 'PostNewAd';
  const PostAdCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Choose Category",
      ),
      body: ListView.builder(
        itemCount: PostNewAdConstants.categorylist.length,
        itemBuilder: (context, index) => customTile(
          onTap: () {
            Get.to(
              () => PostAdSubcategoryPage(
                model: PostNewAdConstants.categorylist[index],
              ),
            );
          },
          title: PostNewAdConstants.categorylist[index].name,
          leading: PostNewAdConstants.categorylist[index].icon,
        ),
      ),
    );
  }
}
