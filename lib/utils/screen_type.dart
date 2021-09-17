import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

T screenType<T>(BuildContext context,  { required T mobile, T? desktopTab}) {
  if (getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop ||
      getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet) {
    return desktopTab!;
  }
    return mobile;
}
