import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class MobileEditUserProfile extends StatelessWidget {
  const MobileEditUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Edit Profile",
      ),
      body: FormBuilder(
          child: Column(
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          FormBuilderTextField(
            name: 'bio',
            decoration: InputDecoration(
                border: OutlineInputBorder(), prefixText: 'hello'),
          )
        ],
      )),
    );
  }
}
