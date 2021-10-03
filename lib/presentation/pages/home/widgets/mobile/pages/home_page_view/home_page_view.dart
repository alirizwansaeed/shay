import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/category/category_page.dart';
import 'package:shay/presentation/pages/pages.dart';
import 'package:shay/presentation/pages/search/search_page.dart';
import '../../../feature_ads_listView.dart';

class HomePageView extends StatelessWidget {
  final _databseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Get.toNamed(SearchPage.routeName);
              },
              child: _searchbar()),
          _catagoryTabs(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
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
          ),
          FeatureAdsListView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: headerText('All Ads'),
          ),
          Obx(
            () => StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2.5),
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
                          adModel: _databseController.allAdsStream[index]))),
            ),
          ),
        ],
      ),
    );
  }

  Padding _searchbar() {
    return Padding(
      padding: const EdgeInsets.all(ScreenConstants.devicePadding),
      child: Container(
        height: 45,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all()),
        child: Text(
          'search mobile, Home utilities, cloting, and more',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }

  SizedBox _catagoryTabs() {
    return SizedBox(
      height: 65,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Mobile');
              Get.toNamed(CategoryPage.routeName, arguments: "Mobile");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.smartphone_outlined, size: 40),
                  Text('Mobile')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Laptop');
              Get.toNamed(CategoryPage.routeName, arguments: "Laptop");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.laptop_outlined, size: 40),
                  Text('Laptop')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Automobiles Parts');
              Get.toNamed(CategoryPage.routeName,
                  arguments: "Automobiles Parts");
            },
            child: SizedBox(
              width: 91,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.drive_eta_outlined, size: 40),
                  Text('Auto Mobile')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Home Utilities');
              Get.toNamed(CategoryPage.routeName, arguments: "Home Utilities");
            },
            child: SizedBox(
              width: 91,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.house_outlined, size: 40),
                  Text('Home Utility')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Sports Goods');
              Get.toNamed(CategoryPage.routeName, arguments: "Sports Goods");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.sports_soccer, size: 40), Text('Sports')],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Cloting');
              Get.toNamed(CategoryPage.routeName, arguments: "Cloting");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.checkroom, size: 40), Text('Cloth')],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Pet & Animals');
              Get.toNamed(CategoryPage.routeName, arguments: "Pet & Animals");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.pets_outlined, size: 40), Text('Pets')],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Kids');
              Get.toNamed(CategoryPage.routeName, arguments: "Kids");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bedroom_baby_outlined, size: 40),
                  Text('Kids')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Real Estate');
              Get.toNamed(CategoryPage.routeName, arguments: "Real Estate");
            },
            child: SizedBox(
              width: 80,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.apartment_outlined,
                    size: 40,
                  ),
                  Text('Real Estate')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Services');
              Get.toNamed(CategoryPage.routeName, arguments: "Services");
            },
            child: SizedBox(
              width: 65,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home_repair_service_outlined, size: 40),
                  Text('Services')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              _databseController.fetchCategory('Uncategorized');
              Get.toNamed(CategoryPage.routeName, arguments: "Uncategorized");
            },
            child: SizedBox(
              width: 100,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.laptop, size: 40), Text('Uncategorized')],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
