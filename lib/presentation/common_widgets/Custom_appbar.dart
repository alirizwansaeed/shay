import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppbar {
  static AppBar appBar(
    BuildContext context, {
    required Widget title,
    Widget? leading,
  }) =>
      AppBar(
        title: title,
        centerTitle: getValueForScreenType(
            context: context, mobile: true, desktop: false, tablet: false),
        leading: leading,
      );
}
