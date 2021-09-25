import 'package:flutter/material.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class AboutUspage extends StatelessWidget {
  static const routeName = 'aboutus';
  const AboutUspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'About Us',
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenConstants.devicePadding),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Shay.pk is the Pakistan’s first online platform which brings used electronic market on fingertips of consumer following easy and sustainable policies to support a great medium between seller and buyer.The sellers are legally signed and bound with us to offer authenticity in a vague environment. They offer every variety within reasonable price plus working guarantee. Apart from seller, a normal user can sell own items by providing details',
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
