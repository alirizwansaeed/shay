import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/sign_in/widgets/sign_in_form.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  static const routeName = 'Sign_in_page';
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  var _passwordVisibility = false.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: getValueForScreenType(
            context: context,
            mobile: null,
            tablet: null,
            desktop: DesktopAppbar()),
        body: SingleChildScrollView(
          child: ScreenTypeLayout.builder(
            mobile: (context) => _mobile(),
            tablet: (context) => _tablet(),
            desktop: (context) => _desktop(),
          ),
        ),
      ),
    );
  }

  Widget _mobile() {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenConstraints.devicePadding),
          child: SignInForm(
            emailAddressController: _emailAddressController,
            passwordController: _passwordController,
            passwordVisibility: _passwordVisibility,
          ),
        )
      ],
    );
  }

  Widget _tablet() {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: SizedBox(
            width: 60.w,
            child: SignInForm(
              emailAddressController: _emailAddressController,
              passwordController: _passwordController,
              passwordVisibility: _passwordVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _desktop() {
    return Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: SizedBox(
            width: 500,
            child: SignInForm(
              emailAddressController: _emailAddressController,
              passwordController: _passwordController,
              passwordVisibility: _passwordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
