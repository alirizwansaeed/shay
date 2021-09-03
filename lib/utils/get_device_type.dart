import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GetDeviceType {
  static Size deviceType(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var deviceSize = Size(412, 845);
    switch (deviceType) {
      case DeviceScreenType.desktop:
        deviceSize = Size(1690, 1020);
        break;
      case DeviceScreenType.tablet:
        deviceSize = Size(786, 1024);
        break;
      case DeviceScreenType.mobile:
        deviceSize = Size(412, 845);
        break;
      default:
    }

    return deviceSize;
  }
}
