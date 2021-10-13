import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/utils/utils.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const routeName = 'forgetpassword';

  final email = 'Email';
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: screenType(context,
            mobile: MobileAppbar(
              title: 'Forget Password',
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
                  mobile: Get.width - 40,
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
        children: [
          SizedBox(
            height: 20,
          ),
          screenType(
            context,
            mobile: SizedBox.shrink(),
            desktopTab: Column(
              children: [
                Text('Forget Password',
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
          Text(
            'Enter your email address below and we’ll send you a link to reset your password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
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
          SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text(
              'Send password',
            ),
            onPressed: sendPassswordButton,
          ),
        ],
      ),
    );
  }

  void sendPassswordButton() async {
    if (_formKey.currentState!.validate()) {
      await Get.find<AuthenticationController>()
          .resetPassword(email: _formKey.currentState!.fields[email]!.value);
    }
  }
}
