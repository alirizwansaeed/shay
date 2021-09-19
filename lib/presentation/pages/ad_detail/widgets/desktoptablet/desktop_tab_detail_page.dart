import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/constants/constants.dart';

import 'package:shay/models/ad.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/ad_detail/widgets/images_view.dart';

class DesktopTabDetailPage extends StatelessWidget {
  final AdModel adModel;
  const DesktopTabDetailPage({
    Key? key,
    required this.adModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopTabletAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ScreenConstants.devicePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 400,
                  width: Get.width * .60,
                  child: ImagesView(adModel: adModel),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rs ' + adModel.price!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border_outlined))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              adModel.title!,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.place_outlined),
                                Text(
                                  adModel.city!,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '${DateFormat().add_d().add_MMM().add_y().format(DateTime.fromMicrosecondsSinceEpoch(adModel.date!.microsecondsSinceEpoch))}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width * .60,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Detail',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Condition"),
                            Text(
                              adModel.itemCondition!,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 8,
                        endIndent: 8,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mobile Number"),
                            Text(
                              adModel.mobileNumber!,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 8,
                        endIndent: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(adModel.description!),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
