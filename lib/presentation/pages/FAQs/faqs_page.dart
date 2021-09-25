import 'package:flutter/material.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class Faqspage extends StatelessWidget {
  static const routeName = 'faqs';
  const Faqspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "FAQs",
      ),
      // body: SingleChildScrollView(
      //   child: ExpansionPanelList(
      //     children: [
      //       ExpansionPanel(
      //         canTapOnHeader: true,
      //         headerBuilder: (context, isExpanded) => Text('data'),
      //         body: Container(),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
