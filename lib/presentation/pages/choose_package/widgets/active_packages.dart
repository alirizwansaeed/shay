import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';

class ActivePackages extends StatelessWidget {
  ActivePackages({Key? key}) : super(key: key);
  final _activeStream = Get.find<UserController>().activePackageStream;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _activeStream.length,
      itemBuilder: (context, index) => Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 240,
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
                    _activeStream[index].packageName! +
                        " (${_activeStream[index].packageType} )",
                    style: _boldStyle(),
                  ),
                  Text("Rs: ${_activeStream[index].packagePrice!}",
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
                                  _activeStream[index]
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
                        Text('Expire Date: ', style: _boldStyle()),
                        Text(
                          DateFormat()
                              .add_d()
                              .add_MMM()
                              .add_y()
                              .format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  _activeStream[index]
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
                        Text("${_activeStream[index].validForDays} Days ",
                            style: _whiteStyle()),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Max Ads Limit: ', style: _boldStyle()),
                        Text(
                          "${_activeStream[index].maxAdsLimit}",
                          style: _whiteStyle(),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Remaining Ads: ', style: _boldStyle()),
                        Text("${_activeStream[index].remainingAdsLimit}",
                            style: _whiteStyle()),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Expire After ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(_activeStream[index].packageExpiryDate!.millisecondsSinceEpoch)).inDays.abs()} Days',
                        style: _boldStyle(),
                      ),
                    )
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
