import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class HelpPage extends StatelessWidget {
  static const routeName = 'help';
  const HelpPage({Key? key}) : super(key: key);
  static final name = 'Name';
  static final email = 'Email';
  static final subject = 'Subject';
  static final contactNumber = 'Contact Number';
  static final adid = 'Ad ID';
  static final helpRegarding = 'Help Regarding';
  static final message = 'Message';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formBuilderText(name),
                FormBuilderTextField(
                  name: name,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(email),
                FormBuilderTextField(
                  name: email,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(subject),
                FormBuilderTextField(
                  name: subject,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(contactNumber),
                FormBuilderTextField(
                  name: contactNumber,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(adid),
                FormBuilderTextField(
                  name: adid,
                  decoration: formFieldDecoration,
                ),
                formBuilderText(message),
                FormBuilderTextField(
                  name: message,
                  maxLines: 4,
                  decoration: formFieldDecoration.copyWith(
                      contentPadding: EdgeInsets.all(10.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    label: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
