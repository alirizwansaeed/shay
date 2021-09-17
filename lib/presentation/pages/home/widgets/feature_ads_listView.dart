import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';

class FeatureAdsListView extends StatelessWidget {
  final _databseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                              : _databseController.adStream[index].photos!['0'],
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
                      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
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
                            _databseController.adStream[index].title ?? 'Title',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _databseController.adStream[index].city ??
                                    'City',
                                maxLines: 1,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                              Text(
                                '${DateFormat().add_d().add_MMM().format(DateTime.fromMicrosecondsSinceEpoch(_databseController.adStream[0].date!.microsecondsSinceEpoch))}',
                                maxLines: 1,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
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
    );
  }
}
