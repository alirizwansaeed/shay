import 'package:flutter/material.dart';

class TabletAppbar extends StatefulWidget implements PreferredSizeWidget {
  const TabletAppbar({Key? key}) : super(key: key);

  @override
  _TabletAppbarState createState() => _TabletAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _TabletAppbarState extends State<TabletAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
