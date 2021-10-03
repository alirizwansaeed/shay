import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class ContactUsPage extends StatelessWidget {
  static const routeName = 'contactus';
  const ContactUsPage({Key? key}) : super(key: key);

  final name = 'Name';
  final contactNumber = 'Contact Number';
  final email = 'Email';
  final message = 'Message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Contact Us',
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
            child: Padding(
          padding: const EdgeInsets.all(ScreenConstants.devicePadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            formBuilderText(name),
            FormBuilderTextField(
              name: name,
              decoration: formFieldDecoration,
              initialValue: '',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.minLength(
                  context,
                  4,
                )
              ]),
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
              initialValue: '',
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
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send_outlined),
                label: Text('Submit'))
          ]),
        )),
      ),
    );
  }
}
