import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/pages/forget_password/forget_password.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const routeName = 'forget_password_page';

  final _forgetEmailAddressController = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.all(ScreenConstraints.devicePadding),
            child: ScreenTypeLayout.builder(
              mobile: (context) => Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  ForgetPasswordForm(
                    forgetEmailAddressController: _forgetEmailAddressController,
                  ),
                ],
              ),
              tablet: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SizedBox(
                      width: 60.w,
                      child: ForgetPasswordForm(
                          forgetEmailAddressController:
                              _forgetEmailAddressController),
                    ),
                  )
                ],
              ),
              desktop: (context) => Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: ForgetPasswordForm(
                          forgetEmailAddressController:
                              _forgetEmailAddressController),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
