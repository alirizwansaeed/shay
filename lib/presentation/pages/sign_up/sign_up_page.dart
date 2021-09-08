import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/pages/sign_up/widgets/sign_up_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = 'sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _passwordVisibility = false.obs;
  var _confirmpasswordVisibility = false.obs;

  final _userNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: NeumorphicColors.background,
        appBar: AppBar(
          leading: Padding(
            padding:
                const EdgeInsets.only(left: ScreenConstraints.devicePadding),
            child: Image.asset(AssetsIcons.logo),
          ),
          leadingWidth: 160,
          backgroundColor: NeumorphicColors.background,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 2),
              child: SizedBox(
                width: 40.w,
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    labelText:
                        'search mobile, Home utilities, cloting, and more',
                    suffix:
                        ElevatedButton(onPressed: () {}, child: Text('SEARCH')),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(onPressed: () {}, child: Text('Login')),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
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
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConstraints.devicePadding,
          ),
          child: SignUpForm(
            usernameController: _userNameController,
            confirmPasswordController: _confirmpasswordController,
            emailAddressController: _emailAddressController,
            passwordController: _passwordController,
            confirmpasswordVisibilty: _confirmpasswordVisibility,
            passwordVisibility: _passwordVisibility,
          ),
        )
      ],
    );
  }

  Widget _tablet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: SizedBox(
            width: 60.w - ScreenConstraints.devicePadding,
            child: SignUpForm(
              usernameController: _userNameController,
              confirmPasswordController: _confirmpasswordController,
              emailAddressController: _emailAddressController,
              passwordController: _passwordController,
              confirmpasswordVisibilty: _confirmpasswordVisibility,
              passwordVisibility: _passwordVisibility,
            ),
          ),
        )
      ],
    );
  }

  Widget _desktop() {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: SizedBox(
              width: 500,
              child: SignUpForm(
                usernameController: _userNameController,
                confirmPasswordController: _confirmpasswordController,
                emailAddressController: _emailAddressController,
                passwordController: _passwordController,
                confirmpasswordVisibilty: _confirmpasswordVisibility,
                passwordVisibility: _passwordVisibility,
              )),
        ),
      ],
    );
  }
}
