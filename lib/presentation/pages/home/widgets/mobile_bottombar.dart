import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandabar/pandabar.dart';

import '../../pages.dart';

class MobileBottomBar extends StatelessWidget {
  const MobileBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PandaBar(
      
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      buttonData: [
        PandaBarButtonData(id: 'HOME', icon: Icons.dashboard, title: 'HOME'),
        PandaBarButtonData(
            id: 'FEATURE ADS', icon: Icons.book, title: 'FEATURE ADS'),
        PandaBarButtonData(
            id: 'MY ADS ', icon: Icons.account_balance_wallet, title: 'MY ADS'),
        PandaBarButtonData(
            id: 'ACCOUNT', icon: Icons.manage_accounts, title: 'ACCOUNT'),
      ],
      onChange: (id) {},
      onFabButtonPressed: () {
        Get.toNamed(PostNewAdPage.routeName);
      },
    );
  }
}
