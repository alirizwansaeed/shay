import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class ContactUsPage extends StatelessWidget {
  static const routeName = 'contactus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Contact Us',
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            shape: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
            leading: FaIcon(FontAwesomeIcons.phoneAlt),
            title: Text('Call us'),
            subtitle: SelectableText('03225863466'),
          ),
          ListTile(
            shape: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
            leading: FaIcon(FontAwesomeIcons.whatsapp),
            title: Text('Whatsapp'),
            subtitle: SelectableText('03225863466'),
          ),
          ListTile(
            shape: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
            leading: FaIcon(FontAwesomeIcons.envelope),
            title: Text('Email'),
            subtitle: SelectableText("info@shay.pk"),
          ),
        ],
      )),
    );
  }

  
}
