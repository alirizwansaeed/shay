import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PostAdPage extends StatelessWidget {
  static const routeName = 'post_ad_page';
  PostAdPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: DesktopAppbar(),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Make New ad',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Select Categories'),
                    Expanded(
                        child: FormBuilderTextField(name: 'selectcatagories'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
