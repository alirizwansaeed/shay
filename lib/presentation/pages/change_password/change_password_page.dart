import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  static const routeName = 'changepassword';
  ChangePasswordPage({Key? key}) : super(key: key);
  static final _currentPassword = 'Current Password';
  static final _newPasword = 'New Password';
  static final _confirmNewPassword = 'Confirm new password';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Change Password',
        actions: [TextButton(onPressed: changePassword, child: Text('change'))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenConstants.devicePadding),
          child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formBuilderText(_currentPassword),
                  FormBuilderTextField(
                    name: _currentPassword,
                    decoration: formFieldDecoration,
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 6),
                    ]),
                  ),
                  formBuilderText(_newPasword),
                  FormBuilderTextField(
                    name: _newPasword,
                    decoration: formFieldDecoration,
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 6),
                    ]),
                  ),
                  formBuilderText(_confirmNewPassword),
                  FormBuilderTextField(
                    name: _confirmNewPassword,
                    decoration: formFieldDecoration,
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 6),
                    ]),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void changePassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (_formKey.currentState!.fields[_confirmNewPassword]!.value !=
            _formKey.currentState!.fields[_newPasword]!.value) {
          _formKey.currentState!.fields[_confirmNewPassword]!
              .invalidate('Password not match');
        } else {
          await Get.find<AuthenticationController>().changePassword(
              currentPassword:
                  _formKey.currentState!.fields[_currentPassword]!.value,
              newPassword:
                  _formKey.currentState!.fields[_confirmNewPassword]!.value);
          Get.back();
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Execption', e.code);
      } catch (e) {
        print(e);
      }
    }
  }
}
