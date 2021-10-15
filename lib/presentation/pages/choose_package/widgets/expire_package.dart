import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';

class ExpirePackages extends StatelessWidget {
  ExpirePackages({Key? key}) : super(key: key);
  final _expireStream = Get.find<UserController>().expirePackageStream;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _expireStream.length,
      itemBuilder: (context, index) => Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xFF120C32).withGreen(50),
              Color(0xFF120C32),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _expireStream[index].packageName! +
                        " (${_expireStream[index].packageType} )",
                    style: _boldStyle(),
                  ),
                  Text("Rs: ${_expireStream[index].packagePrice!}",
                      style: _boldStyle())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Purchased Date: ', style: _boldStyle()),
                        Text(
                          DateFormat()
                              .add_d()
                              .add_MMM()
                              .add_y()
                              .format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  _expireStream[index]
                                      .packagePurchasingDate!
                                      .millisecondsSinceEpoch,
                                ),
                              )
                              .toString(),
                          style: _whiteStyle(),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Expired on: ', style: _boldStyle()),
                        Text(
                          DateFormat()
                              .add_d()
                              .add_MMM()
                              .add_y()
                              .format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  _expireStream[index]
                                      .packageExpiryDate!
                                      .millisecondsSinceEpoch,
                                ),
                              )
                              .toString(),
                          style: _whiteStyle(),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Valid For: ', style: _boldStyle()),
                        Text("${_expireStream[index].validForDays} Days ",
                            style: _whiteStyle()),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Max Ads Limit: ', style: _boldStyle()),
                        Text(
                          "${_expireStream[index].maxAdsLimit}",
                          style: _whiteStyle(),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Remaining Ads: ', style: _boldStyle()),
                        Text("${_expireStream[index].remainingAdsLimit}",
                            style: _whiteStyle()),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _whiteStyle() => TextStyle(color: Colors.white);

  TextStyle _boldStyle() {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  }
}
