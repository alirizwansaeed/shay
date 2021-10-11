import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';

import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/home/home_page.dart';

class PayWithMobilePage extends StatelessWidget {
  final PackageModel model;
  const PayWithMobilePage({
    Key? key,
    required this.model,
  }) : super(key: key);
  final phoneNumber = 'phone Number';
  final cnicNumber = 'cnic Number';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Pay with Jazz Cash Account",
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formBuilderText('Enter your jazz Cash Mobile Number'),
                FormBuilderTextField(
                  name: phoneNumber,
                  maxLength: 11,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 11),
                    FormBuilderValidators.integer(context),
                  ]),
                  decoration: formFieldDecoration.copyWith(
                      prefixIcon: Icon(Icons.phone)),
                ),
                formBuilderText('Enter your last 6 cnic digits'),
                FormBuilderTextField(
                  name: phoneNumber,
                  maxLength: 6,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 6),
                      FormBuilderValidators.integer(context),
                    ],
                  ),
                  decoration: formFieldDecoration.copyWith(
                      prefixIcon: Icon(Icons.account_balance_wallet)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _proceedButton,
                    child: Text('Proceed'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _proceedButton() {
    Get.find<UserController>().addPackage(model);
    Get.offAllNamed(HomePage.routeName);
  }
}
