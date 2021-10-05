import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/ad_detail/widgets/images_view.dart';
import 'package:shay/presentation/pages/login/login_page.dart';

import '../user_information.dart';

class MobileDetailPage extends StatelessWidget {
  final AdModel adModel;
  MobileDetailPage({
    Key? key,
    required this.adModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<DatabaseController>().adLikedbyMe(adModel.docId!);
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
                    Obx(
                      () => IconButton(
                          onPressed: () async {
                            if (Get.find<AuthenticationController>()
                                    .currentUserState ==
                                null)
                              Get.toNamed(LoginPage.routeName);
                            else {

                              await Get.find<UserController>().likeAd(
                                  docid: adModel.docId!,
                                  isliked: Get.find<DatabaseController>()
                                          .adLikedByMe
                                          .value
                                      ? false
                                      : true);
                              await Get.find<DatabaseController>()
                                  .adLikedbyMe(adModel.docId!);
                            }
                          },
                          icon: Icon(
                              Get.find<DatabaseController>().adLikedByMe.value
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_outlined)),
                    )
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
                    SelectableText(
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ad Type"),
                    Text(
                      adModel.type!,
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
              if (adModel.videoUrl != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Video Url"),
                      SizedBox(height: 4),
                      SelectableText(
                        adModel.videoUrl!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Divider(
                        indent: 8,
                        endIndent: 8,
                      ),
                    ],
                  ),
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
              UserInformation(
                uid: adModel.uid!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
