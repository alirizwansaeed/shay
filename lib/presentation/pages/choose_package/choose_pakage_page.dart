import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/choose_package/widgets/active_packages.dart';
import 'package:shay/presentation/pages/choose_package/widgets/buy_package.dart';
import 'package:shay/presentation/pages/choose_package/widgets/expire_package.dart';

class ChoosePakagePage extends StatelessWidget {
  static const routeName = 'choosepackage';
  const ChoosePakagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Packages',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
                padding: EdgeInsets.only(bottom: 10),
                labelPadding: EdgeInsets.only(bottom: 6),
                labelColor: Colors.black,
                tabs: [Text('Buy'), Text('Active'), Text('Expire')]),
          ),
          body: TabBarView(
            children: [
              BuyPackage(),
              ActivePackages(),
              ExpirePackages(),
            ],
          )),
    );
  }
}
