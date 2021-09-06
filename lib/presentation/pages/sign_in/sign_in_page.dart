import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'sign_in.dart';

class SignInPage extends StatelessWidget {
  static const routeName = 'Sign_in_page';
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenTypeLayout.builder(
        mobile: (context) => Mobile(),
        tablet: (context) => Tablet(),
        desktop: (context) => Desktop(),
      ),
    );
  }
}
