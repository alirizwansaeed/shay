import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

T? screenType<T>(BuildContext context,  { T? mobile, T? desktopTab}) {
  if (getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop ||
      getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet) {
    return desktopTab;
  } else
    return mobile;
}
