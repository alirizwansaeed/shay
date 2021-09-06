import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'sign_up.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = 'sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => Mobile(),
      tablet: (context) => Tablet(),
      desktop: (context) => Desktop(),
    );
  }
}
