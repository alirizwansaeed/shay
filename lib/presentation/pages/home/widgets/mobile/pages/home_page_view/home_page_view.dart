import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/home/widgets/feature_ads_listView.dart';

class HomePageView extends StatelessWidget {
  final _databseController = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Text("Featured Ads",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        //  FeatureAdsListView(),
        SizedBox(
          height: 250,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _databseController.adStream.length,
              itemBuilder: (context, index) => SizedBox(
                height: 250,
                width: 180,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: .7,
                          child: Image.network(
                              _databseController.adStream[index].photos!.isEmpty
                                  ? ''
                                  : _databseController
                                      .adStream[index].photos!['0'],
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                print(loadingProgress);
                                return SizedBox();
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.grey.shade200,
                                    child: Text('No image'),
                                  ),
                              fit: BoxFit.cover)),
                      FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: .3,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, right: 5, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rs ${_databseController.adStream[index].price ?? 'price'}',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                _databseController.adStream[index].title ??
                                    'Title',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _databseController.adStream[index].city ??
                                        'City',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                    '${DateFormat().add_d().add_MMM().format(DateTime.fromMicrosecondsSinceEpoch(_databseController.adStream[0].date!.microsecondsSinceEpoch))}',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.black.withOpacity(.4),
                            width: 70,
                            child: Text(
                              'Featured',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
