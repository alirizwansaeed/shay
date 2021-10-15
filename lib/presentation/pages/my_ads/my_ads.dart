import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/pages/pages.dart';

class MyAds extends StatelessWidget {
  static const routeName = 'myallads';

  final _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _userController.allAds.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(8.0),
          shape: Border(left: BorderSide(color: Colors.green, width: 6)),
          child: InkWell(
            onTap: () {
              Get.toNamed(AdDetailPage.routeName,
                  arguments: _userController.allAds[index]);
            },
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    color: Colors.green.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${DateFormat().add_yMMMMd().format(DateTime.fromMicrosecondsSinceEpoch(_userController.allAds[index].date!.microsecondsSinceEpoch))}'),
                        Text(_userController.allAds[index].status!,
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 6),
                        color: Colors.grey.shade200,
                        width: 100,
                        height: 100,
                        child: Image.network(
                          _userController.allAds[index].photos!['0'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _userController.allAds[index].title!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Rs: " +
                                      _userController.allAds[index].price!),
                                  if (_userController.allAds[index].isFeatured!)
                                    Text('Featured'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                      onPressed: () => Get.toNamed(
                                          EditAdPage.routeName,
                                          arguments: index),
                                      child: Text('Edit')),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  OutlinedButton(
                                      onPressed:()=> _deleteButton(index),
                                      child: Text('delete')),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _deleteButton( int index ) {
    Get.defaultDialog(
        onConfirm: () {
          Get.back();
          Get.find<PostAndEditAdsController>().deleteAd(
              _userController
                  .allAds[index]);
        },
        title: _userController
            .allAds[index].title!,
        middleText:
            'Are you sure to delete',
        textConfirm: 'Delete',
        textCancel: 'Cancel');
  }
}
