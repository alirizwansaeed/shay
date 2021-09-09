import 'package:flutter/material.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppbar({Key? key}) : super(key: key);

  @override
  _MobileAppbarState createState() => _MobileAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _MobileAppbarState extends State<MobileAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
