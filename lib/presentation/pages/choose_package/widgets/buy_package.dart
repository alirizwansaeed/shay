// ignore_for_file: must_be_immutable

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/payment_options/pay_with_mobile/pay_with_mobile_page.dart';

class BuyPackage extends StatelessWidget {
  BuyPackage({Key? key}) : super(key: key);
  late PackageModel model;

  List<PackageModel> silverpackages = [
    PackageModel(
      maxAdsLimit: 1,
      packageName: 'Novice',
      packagePrice: 10,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 7),
        ),
      ),
    )
  ];

  void _paymentTypeButton(PackageModel model) {
    Get.defaultDialog(
        title: 'Choose payment type',
        content: Column(
          children: [
            Divider(),
            ListTile(
                onTap: () {
                  Get.back();
                  Get.to(PayWithMobilePage(model: model));
                },
                title: Text('Pay with Jazz Cash Account')),
            Divider(),
            ListTile(onTap: () {}, title: Text('Pay with Card')),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("SILVER"),
              trailing: Text('7 days'),
              childrenPadding: EdgeInsets.symmetric(vertical: 10),
              children: PackagesList.silver.entries
                  .map((e) => InkWell(
                        onTap: () =>
                            _paymentTypeButton(PackagesList.silver[e.key]!),
                        child: _card(
                            packagename: e.value.packageType!,
                            price: e.value.packagePrice!,
                            numberOfAds: e.value.maxAdsLimit!),
                      ))
                  .toList()),
          Divider(),
          ExpansionTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("GOLD"),
              trailing: Text('14 days'),
              childrenPadding: EdgeInsets.symmetric(vertical: 10),
              children: PackagesList.gold.entries
                  .map((e) => InkWell(
                        onTap: () =>
                            _paymentTypeButton(PackagesList.gold[e.key]!),
                        child: _card(
                            packagename: e.value.packageType!,
                            price: e.value.packagePrice!,
                            numberOfAds: e.value.maxAdsLimit!),
                      ))
                  .toList()),
          Divider(),
          ExpansionTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("PLATINUM"),
            trailing: Text('30 days'),
            childrenPadding: EdgeInsets.symmetric(vertical: 10),
            children: PackagesList.platinum.entries
                .map((e) => InkWell(
                      onTap: () =>
                          _paymentTypeButton(PackagesList.platinum[e.key]!),
                      child: _card(
                        packagename: e.value.packageType!,
                        price: e.value.packagePrice!,
                        numberOfAds: e.value.maxAdsLimit!,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _card(
      {required String packagename,
      required int price,
      required int numberOfAds}) {
    return Column(
      children: [
        Divider(),
        Card(
          color: Colors.lightGreen.shade100,
          child: SizedBox(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        packagename,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RS $price',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formBuilderText('Featured ad on Homepage'),
                      formBuilderText('$numberOfAds Featured ads availability'),
                      formBuilderText('Reach up to 10x plus people'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
