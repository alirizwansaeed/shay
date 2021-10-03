import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/services/emailsend.dart';

class ContactUsPage extends StatelessWidget {
  static const routeName = 'contactus';

  final name = 'Name';
  final contactNumber = 'Contact Number';
  final email = 'Email';
  final message = 'Message';
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Contact Us',
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(ScreenConstants.devicePadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formBuilderText(name),
                    FormBuilderTextField(
                      name: name,
                      decoration: formFieldDecoration,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context),
                        ],
                      ),
                      maxLength: 30,
                    ),
                    formBuilderText(contactNumber, topPadding: 0),
                    FormBuilderTextField(
                      name: contactNumber,
                      decoration: formFieldDecoration,
                      maxLength: 11,
                    ),
                    formBuilderText(email, topPadding: 0),
                    FormBuilderTextField(
                      name: email,
                      decoration: formFieldDecoration,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    formBuilderText(message),
                    FormBuilderTextField(
                      name: message,
                      maxLines: 4,
                      validator: FormBuilderValidators.required(context),
                      decoration: formFieldDecoration.copyWith(
                          contentPadding: EdgeInsets.all(10.0)),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _submitButton,
                        icon: Icon(Icons.send_outlined),
                        label: Text('Submit'),
                      ),
                    )
                  ]),
            )),
      ),
    );
  }

  void _submitButton() {
    var form = _formKey.currentState;
    if (form!.validate()) {
      String content = form.fields[message]!.value +
          '\n\nUser Information\nName: ' +
          form.fields[name]!.value +
          '\nContact Number: ' +
          form.fields[contactNumber]!.value +
          '\nEmail: ' +
          form.fields[email]!.value;
      Get.back();
      EmailSend.sendemail(emailcontent: content, emailSubject: 'Contact us');
    }
  }
}
