import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/pages/ad_detail/widgets/desktoptablet/desktop_tab_detail_page.dart';
import 'package:shay/presentation/pages/ad_detail/widgets/mobile/mobile_detail_page.dart';

class AdDetailPage extends StatelessWidget {
  static const routeName = 'addetail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AdModel;
    Get.find<DatabaseController>().fetchSpecificUser(args.uid!);
    return ScreenTypeLayout.builder(
      mobile: (context) => MobileDetailPage(
        adModel: args,
      ),
      desktop: (context) => DesktopTabDetailPage(adModel: args),
    );
  }
}
