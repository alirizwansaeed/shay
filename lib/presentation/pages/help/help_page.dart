import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/services/emailsend.dart';

class HelpPage extends StatelessWidget {
  static const routeName = 'help';
  HelpPage({Key? key}) : super(key: key);
  static final name = 'Name';
  static final email = 'Email';
  static final subject = 'Subject';
  static final contactNumber = 'Contact Number';
  static final adid = 'Ad ID';
  static final helpRegarding = 'Help Regarding';
  static final message = 'Message';
  final _authcontroller = Get.find<AuthenticationController>();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Help',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenConstants.devicePadding),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formBuilderText(name + '*'),
                FormBuilderTextField(
                  name: name,
                  maxLength: 30,
                  initialValue: _authcontroller.currentUserState != null
                      ? Get.find<UserController>().currentUserStream.displayName
                      : '',
                  validator: FormBuilderValidators.required(context),
                  decoration: formFieldDecoration,
                ),
                formBuilderText(email + '*'),
                FormBuilderTextField(
                  name: email,
                  initialValue: _authcontroller.currentUserState != null
                      ? Get.find<UserController>()
                          .currentUserStream
                          .email!
                          .trim()
                      : null,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context)
                  ]),
                  decoration: formFieldDecoration,
                ),
                formBuilderText(subject + '*'),
                FormBuilderTextField(
                  name: subject,
                  decoration: formFieldDecoration,
                  validator: FormBuilderValidators.required(context),
                ),
                formBuilderText(
                  helpRegarding + '*',
                ),
                FormBuilderRadioGroup(
                  focusNode: FocusNode(),
                  name: helpRegarding,
                  validator: FormBuilderValidators.required(context),
                  decoration: formFieldDecoration,
                  options: [
                    FormBuilderFieldOption(
                      value: 'Buy',
                      child: Text('Buy'),
                    ),
                    FormBuilderFieldOption(
                      value: 'Sell',
                      child: Text('Sell'),
                    ),
                  ],
                ),
                formBuilderText(contactNumber),
                FormBuilderTextField(
                  name: contactNumber,
                  maxLength: 11,
                  initialValue: _authcontroller.currentUserState != null
                      ? Get.find<UserController>()
                          .currentUserStream
                          .mobileNumber
                      : null,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(adid + '*'),
                FormBuilderTextField(
                  name: adid,
                  decoration: formFieldDecoration,
                  validator: FormBuilderValidators.required(context),
                ),
                formBuilderText(message + '*'),
                FormBuilderTextField(
                  name: message,
                  maxLines: 4,
                  maxLength: 2000,
                  validator: FormBuilderValidators.required(context),
                  decoration: formFieldDecoration.copyWith(
                      contentPadding: EdgeInsets.all(10.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: _submitButton,
                      icon: Icon(Icons.send),
                      label: Text('Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitButton() {
    if (_formKey.currentState!.validate()) {
      var form = _formKey.currentState;
      String content = form!.fields[message]!.value +
          '\n\nHelp Regarding: ' +
          form.fields[helpRegarding]!.value +
          '\n\nad ID: ' +
          form.fields[adid]!.value +
          '\n\nUser Information\nName: ' +
          form.fields[name]!.value +
          '\nContact Number: ' +
          form.fields[contactNumber]?.value +
          '\nEmail: ' +
          form.fields[email]!.value;

      Get.back();
      EmailSend.sendemail(
          emailcontent: content, emailSubject: form.fields[subject]!.value);
    }
  }
}
