import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shay/constants/assets_icons.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/pages/pages.dart';

class UserInformation extends StatelessWidget {
  final String uid;
  const UserInformation({
    Key? key,
    required this.uid,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
        future: Get.find<DatabaseController>().fetchUser(uid),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return InkWell(
              onTap: () {
                Get.find<DatabaseController>().fetchSpecificUserAds(uid);
                Get.toNamed(SpecificUserAdsPage.routeName,
                    arguments: snapshot.data!.displayName);
              },
              child: Container(
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
                          backgroundImage: AssetImage(Assets.avatar),
                          radius: 30,
                        ),
                        SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.displayName!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              'Member Since ${DateFormat().add_yMMM().format(DateTime.fromMicrosecondsSinceEpoch(snapshot.data!.creationdate!.microsecondsSinceEpoch))}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          else
            return SizedBox.shrink();
        });
  }
}
