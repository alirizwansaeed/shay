import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  static const routeName = 'changepassword';
  const ChangePasswordPage({Key? key}) : super(key: key);
  static final currentpassword = 'Current Password';
  static final newpasword = 'New Password';
  static final confirmNewPassword = 'Confirm new password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Change Password',
        actions: [TextButton(onPressed: () {}, child: Text('change'))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FormBuilder(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formBuilerText(currentpassword),
              FormBuilderTextField(
                  name: currentpassword, decoration: formFieldDecoration),
              formBuilerText(newpasword),
              FormBuilderTextField(
                  name: newpasword, decoration: formFieldDecoration),
              formBuilerText(confirmNewPassword),
              FormBuilderTextField(
                  name: confirmNewPassword, decoration: formFieldDecoration),
            ],
          )),
        ),
      ),
    );
  }
}
