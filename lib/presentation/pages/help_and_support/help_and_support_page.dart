import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/pages.dart';

class HelpAndSupportPage extends StatelessWidget {
  static const routeName = 'help&support';
  const HelpAndSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Help And Support",
      ),
      body: Column(
        children: [
          customTile(
            title: 'Contact Us',
            leading: Icons.contact_support_outlined,
            onTap: () => Get.toNamed(ContactUsPage.routeName),
          ),
          customTile(
            title: 'Help',
            leading: Icons.help_outline,
            onTap: () => Get.toNamed(HelpPage.routeName),
          ),
          customTile(
            title: 'FAQs',
            leading: Icons.quiz_outlined,
            onTap: () => Get.toNamed(Faqspage.routeName),
          ),
          customTile(
            title: 'About Us',
            leading: Icons.store_outlined,
            onTap: () => Get.toNamed(AboutUspage.routeName),
          ),
        ],
      ),
    );
  }
}
