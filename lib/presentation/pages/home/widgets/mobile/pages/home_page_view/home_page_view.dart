import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/category/category_page.dart';
import 'package:shay/presentation/pages/pages.dart';
import '../../../feature_ads_listView.dart';

class HomePageView extends StatelessWidget {
  final _databseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 170,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 10)],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF120C32).withGreen(50),
                  Color(0xFF120C32),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 40,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: PostNewAdConstants.typeList
                              .map(
                                (e) => RotateAnimatedText(
                                  e,
                                  textStyle: GoogleFonts.bebasNeue(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Explore',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(' For You',
                        style: GoogleFonts.nunito(
                          color: Colors.white.withOpacity(.6),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(SearchPage.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 40,
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.pink,
                        ),
                        Text('  I am Looking For ?',
                            style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
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

  SizedBox _catagoryTabs() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
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
