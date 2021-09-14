import 'package:flutter/material.dart';

class MobileAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const MobileAppbar({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(color: Colors.black),
            )
          : null,
      centerTitle: true,
      actions: actions,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
