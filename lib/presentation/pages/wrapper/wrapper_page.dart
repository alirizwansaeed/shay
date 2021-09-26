import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/home/home_page.dart';

class WrapperPage extends StatelessWidget {
  static const routeName = 'wrapper';
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.offNamed(HomePage.routeName),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0xFFD20E63),
                child: SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Buy And Sell',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                        SizedBox(
                            width: Get.width * .6,
                            child: Image.asset(
                              Assets.wrapper1,
                              fit: BoxFit.fill,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Color(0xFF84C0FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Text(
                                  'Shay Vendor',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                              ),
                              SizedBox(
                                  height: 180,
                                  child: Image.asset(
                                    Assets.wrapper2,
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Color(0xFFFED271),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  'Become a Vendor',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                              ),
                              SizedBox(
                                  height: 180,
                                  child: Image.asset(
                                    Assets.wrapper3,
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
