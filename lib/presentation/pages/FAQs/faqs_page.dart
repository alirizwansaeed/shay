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
      body: SingleChildScrollView(
          child: Column(
        children: [
          _tile(
            'How do I create my account?',
            [
              _element(1, 'Click on login'),
              _element(2,
                  'There are 4 options for registration (Facebook,Gmail,Apple Or Email)'),
              _element(3, 'Select any feasible option'),
              _element(
                  4, 'Login with your credentials, and you are ready to go!')
            ],
          ),
          _tile(
            'How can I post an ad on Shay.PK?',
            [
              _element(1, 'Login into your account'),
              _element(2, 'Click on “Submit Ad”'),
              _element(3, 'Fill details of your ad'),
              _element(4, 'Choose desirable package'),
              _element(5, 'Click on “Post Ad”')
            ],
          ),
          _tile(
            'Is there any ad(s) posting limit?',
            [
              _element(1, 'Yes! You can post up to 8 ads'),
            ],
          ),
          _tile(
            'How mobile/laptop shops work on shay.pk?',
            [
              _element(1,
                  'Mobile shops are 100% real and are legally registered with shay.pk, however shay.pk doesn’t involve in any dealing, shay.pk only provides a medium between seller and buyer'),
            ],
          ),
          _tile(
            'Can I buy anything directly from Shay.pk?',
            [
              _element(1,
                  'Shay.Pk doesn’t involve in any trade, Shay.PK only provides a medium between seller and buyer.'),
            ],
          ),
          _tile(
            'Does Shay.PK charge any commission from on Buying/Selling?',
            [
              _element(1,
                  'No! Shay.PK doesn’t charge any amount on any transaction, Shay.PK only provides a medium between seller and buyer.'),
            ],
          ),
          _tile(
            'What is SKU on vendor portal?',
            [
              _element(1,
                  'SKU is commonly known as Stock Keeping Unit. It is different for every product and should be a number more than one (1)'),
            ],
          ),
          _tile(
            'How many products a vendor should add on his/her account?',
            [
              _element(1,
                  'A vendor/shop holder can add as many as products on an account but should add more detail / specification of product so that buyer can decide easily.'),
            ],
          ),
          _tile(
            'How can I return purchased item?',
            [
              _element(1,
                  'Shay.Pk doesn’t involve any deal and return policy might vary with vendor.'),
            ],
          ),
          _tile(
            'How much warranty I can expect for an item?',
            [
              _element(1,
                  'Warranty and other relevant policies are defined by each vendor solely. Shay.Pk is just a platform to make hassle free trade'),
            ],
          ),
          _tile(
            'Vendor is unethical, what should I do?',
            [
              _element(1,
                  'All vendors are registered with Shay.Pk. It is suggested to report us any unethical activity / misguidance at info@shay.pk.'),
            ],
          ),
        ],
      )),
    );
  }

  ExpansionTile _tile(String header, List<Widget> children) {
    return ExpansionTile(
      backgroundColor: Colors.grey.shade300,
      title: formBuilderText(header),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.all(8.0),
      children: children,
    );
  }

  Widget _element(int number, String body) {
    return Column(
      children: [
        Row(
          children: [
            headerText('$number'),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(body),
            )
          ],
        ),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
