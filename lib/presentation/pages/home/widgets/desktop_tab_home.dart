import 'package:flutter/material.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class DesktopTabHome extends StatelessWidget {
  const DesktopTabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopTabletAppbar(),
    );
  }
}
