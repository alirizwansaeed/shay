import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/pages/home/widgets/feature_ads_listView.dart';

class HomePageView extends StatelessWidget {
  // final _databseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          ),
          _catagoryTabs(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured Ads",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Text('VIEW ALL'),
                )
              ],
            ),
          ),
          FeatureAdsListView(),
        ],
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
