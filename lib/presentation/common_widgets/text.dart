import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///Form Text used in signin, sign up , postnew ads , edit profile etc

Widget formBuilderText(String text,
    {double topPadding = 8.0, double bottomPadding = 5.0}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: topPadding),
      Text(
        text,
        maxLines: 1,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blueGrey.shade600),
      ),
      SizedBox(height: bottomPadding)
    ],
  );
}

/// header text
Widget headerText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
  );
}

///  custom tile as button for navigaton
Widget customTile({
  required VoidCallback onTap,
  required String? title,
  String? subTitle,
  IconData? leading,
}) {
  return ListTile(
    shape: Border(bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
    leading: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Icon(leading),
    ),
    subtitle: subTitle == null ? null : Text(subTitle),
    trailing: Icon(Icons.arrow_forward_ios_outlined),
    horizontalTitleGap: 0,
    title: Text(
      title!,
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
    onTap: onTap,
  );
}
