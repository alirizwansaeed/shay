import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  static const routeName = 'signup';

  final _formKey = GlobalKey<FormBuilderState>();

  //FORM FIELDS NAME
  final username = 'User Name';
  final email = 'Email';
  final password = 'Password';
  final confirmPassword = 'Confirm Password';
  var isloading = false.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: screenType(context,
            mobile: MobileAppbar(
              title: 'Sign up',
            ),
            desktopTab: DesktopTabletAppbar()),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: screenType(
                context,
                mobile: null,
                desktopTab: BoxDecoration(border: Border.all()),
              ),
              width: getValueForScreenType<double>(
                context: context,
                mobile: Get.width - 40,
                tablet: 500,
                desktop: 500,
              ),
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
        children: [
          SizedBox(height: 20),
          screenType(
            context,
            mobile: SizedBox.shrink(),
            desktopTab: Column(
              children: [
                Text('Sign up',
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
          FormBuilderTextField(
            name: username,
            maxLength: 30,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
            ]),
            decoration: formFieldDecoration.copyWith(
              labelText: username,
            ),
          ),
          SizedBox(
            height: 8,
          ),
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
          FormBuilderTextField(
            name: password,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 6),
              FormBuilderValidators.match(context, '^(?!.* )',
                  errorText: 'space not allowed')
            ]),
            decoration: formFieldDecoration.copyWith(
              labelText: password,
            ),
          ),
          SizedBox(height: 15),
          FormBuilderTextField(
            name: confirmPassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 6),
              FormBuilderValidators.match(context, '^(?!.* )',
                  errorText: 'space not allowed'),
            ]),
            decoration: formFieldDecoration.copyWith(
              labelText: confirmPassword,
            ),
          ),
          SizedBox(height: 15),
          Obx(
            () => ElevatedButton(
              onPressed: isloading.value ? null : signupButton,
              child: Text('Sign up'),
            ),
          )
        ],
      ),
    );
  }

  void signupButton() async {
    if (_formKey.currentState!.validate() &&
        _formKey.currentState!.fields[password]!.value ==
            _formKey.currentState!.fields[confirmPassword]!.value) {
      await Get.find<AuthenticationController>().createUserWithEmailPassword(
          username: _formKey.currentState!.fields[username]!.value.toString().trim(),
          email: _formKey.currentState!.fields[email]!.value.toString().trim(),
          password: _formKey.currentState!.fields[password]!.value.toString().trim(),
          );
    } else {
      _formKey.currentState!.invalidateField(
          name: confirmPassword, errorText: 'Password Not Match');
    }
  }
}
