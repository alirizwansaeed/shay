import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/constants/assets_icons.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/ad_detail/widgets/images_view.dart';

class MobileDetailPage extends StatelessWidget {
  final AdModel adModel;
  MobileDetailPage({
    Key? key,
    required this.adModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "${adModel.title}",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 300, child: ImagesView(adModel: adModel)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs ' + adModel.price!,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline_outlined))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  adModel.title!,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.place_outlined),
                    Text(
                      adModel.city!,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey.shade600,
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(adModel.description!),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Information',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          backgroundImage:
                              AssetImage(AssetsIconsConstants.avatar),
                          radius: 30,
                        ),
                        SizedBox(width: 6),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Get.find<DatabaseController>()
                                    .specificUserData
                                    .displayName!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Member Since ${DateFormat().add_yMMM().format(DateTime.fromMicrosecondsSinceEpoch(Get.find<DatabaseController>().specificUserData.creationdate!.microsecondsSinceEpoch))}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
