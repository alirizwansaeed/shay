import 'package:flutter/material.dart';

class ScreenConstraints {
  /// padding around the corners of screen
  static double devicePadding = 20.0;

  /// screen width
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  ///screen height
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
