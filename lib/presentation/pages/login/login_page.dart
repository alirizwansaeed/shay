import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/common_widgets/desktop_tablet_appbar.dart';
import 'package:shay/presentation/pages/login/widgets/social_auth.dart';
import 'package:shay/presentation/pages/pages.dart';
import 'package:shay/utils/screen_type.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static const routeName = 'login';
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
//FORM FIELD NAMES
  final email = 'Email';
  final password = 'Password';
  var obsecurePassword = true.obs;
  var _isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: screenType(context,
            mobile: MobileAppbar(
              title: 'Log in',
            ),
            desktopTab: DesktopTabletAppbar()),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: screenType(
                context,
                mobile: null,
                desktopTab: BoxDecoration(border: Border.all()),
              ),
              padding: EdgeInsets.all(10),
              width: getValueForScreenType<double>(
                  context: context,
                  mobile: Get.width - 30,
                  tablet: 500,
                  desktop: 500),
              child: _form(context),
            ),
          ),
        ),
      ),
    );
  }

  FormBuilder _form(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          screenType(
            context,
            mobile: SizedBox.shrink(),
            desktopTab: Column(
              children: [
                Text('Log in',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    )),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
              ],
            ),
          ),
          SocialAuth(),
          SizedBox(height: 15),
          FormBuilderTextField(
            name: email,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context)
            ]),
            decoration: formFieldDecoration.copyWith(
              labelText: email,
            ),
          ),
          SizedBox(height: 15),
          Obx(
            () => FormBuilderTextField(
              name: password,
              obscureText: obsecurePassword.value ? true : false,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.minLength(context, 6),
                FormBuilderValidators.match(context, '^(?!.* )',
                    errorText: 'space not allowed')
              ]),
              decoration: formFieldDecoration.copyWith(
                suffixIcon: IconButton(
                  onPressed: obsecurePassword.toggle,
                  icon: Icon(obsecurePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
                labelText: password,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 15),
          Obx(() => ElevatedButton(
              style: ButtonStyle(),
              onPressed: _isloading.value ? null : loginButton,
              child: Text('Sign in'))),
          SizedBox(height: 15),
          screenType(context,
              mobile: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _signupRow(),
                  Align(
                      alignment: Alignment.centerRight,
                      child: _forgetPasswordButton()),
                ],
              ),
              desktopTab: Row(
                  children: [_signupRow(), Spacer(), _forgetPasswordButton()])),
        ],
      ),
    );
  }

  TextButton _forgetPasswordButton() {
    return TextButton(
      onPressed: () => Get.toNamed(ForgetPasswordPage.routeName),
      child: Text(
        'Forget Password',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }

  Row _signupRow() {
    return Row(
      children: [
        Text("Don't have an account?"),
        TextButton(
            onPressed: () => Get.toNamed(SignUpPage.routeName),
            child: Text(
              'Sign up',
              style: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  void loginButton() async {
    if (_formKey.currentState!.validate()) {
      try {
        _isloading(true);
        await Get.find<AuthenticationController>().signInWithEmailPassword(
          email: _formKey.currentState!.fields[email]!.value,
          password: _formKey.currentState!.fields[password]!.value,
        );
        Get.back();
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Execption', e.code);
      } catch (e) {
        print(e);
      } finally {
        _isloading(false);
      }
    }
  }
}
