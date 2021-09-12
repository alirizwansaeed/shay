import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = 'signup';

  final _formKey = GlobalKey<FormBuilderState>();

  //FORM FIELDS NAME

  final username = 'User Name';
  final email = 'Email';
  final password = 'Password';
  final confirmPassword = 'Confirm Password';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: screenType(context,
            mobile: MobileAppbar(), desktopTab: DesktopTabletAppbar()),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all()),
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
          Text('Sign up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              )),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          FormBuilderTextField(
            name: username,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.required(context),
            decoration: InputDecoration(
              labelText: username,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          FormBuilderTextField(
            name: email,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context)
            ]),
            decoration: InputDecoration(
              labelText: email,
              border: OutlineInputBorder(),
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
            decoration: InputDecoration(
              labelText: password,
              border: OutlineInputBorder(),
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
            decoration: InputDecoration(
              labelText: confirmPassword,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: signupButton,
            child: Text('Sign up'),
          )
        ],
      ),
    );
  }

  void signupButton() {
    if (_formKey.currentState!.validate() &&
        _formKey.currentState!.fields[password]!.value ==
            _formKey.currentState!.fields[confirmPassword]!.value) {
      //create new user
      Get.find<AuthenticationController>().createUserWithEmailPassword(
          userName: _formKey.currentState!.fields[username]!.value,
          email: _formKey.currentState!.fields[email]!.value,
          password: _formKey.currentState!.fields[password]!.value);
    } else {
      _formKey.currentState!.invalidateField(
          name: confirmPassword, errorText: 'Password Not Match');
    }
  }
}
