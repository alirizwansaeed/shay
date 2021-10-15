// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shay/controllers/controllers.dart';

import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/choose_package/choose_pakage_page.dart';
import 'package:shay/services/database.dart';

class PostAdPackagePage extends StatelessWidget {
  final AdModel model;
  final _usercontroller = Get.find<UserController>();
  final _adcontroller = Get.find<PostAndEditAdsController>();
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, Timestamp> value = {};
  PostAdPackagePage({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MobileAppbar(
          title: 'Choose Package',
          actions: [
            TextButton(
                onPressed: () {
                  Get.toNamed(ChoosePakagePage.routeName);
                },
                child: Text('Buy Package'))
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: submitButton,
            child: Text('Submit'),
          ),
        ),
        body: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderRadioGroup(
                name: "package",
                focusNode: FocusNode(),
                wrapDirection: Axis.vertical,
                orientation: OptionsOrientation.vertical,
                validator: FormBuilderValidators.required(context),
                options: [
                  FormBuilderFieldOption(
                    value: [false],
                    child: ListTile(
                      title: Text("Regular Ad"),
                      trailing: Text('Free'),
                    ),
                  ),
                  ..._usercontroller.availablePackagesStream.map(
                    (e) => FormBuilderFieldOption(
                      value: [true, e.docId, e.remainingAdsLimit],
                      child: ListTile(
                        title: Text('Featured ad(${e.remainingAdsLimit} left)'),
                        subtitle: Text(
                            'Package end on ${DateFormat().add_d().add_MMM().format(DateTime.fromMillisecondsSinceEpoch(e.packageExpiryDate!.millisecondsSinceEpoch))}'),
                        trailing: Text('Paid'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitButton() {
    if (_formKey.currentState!.validate()) {
      var value = _formKey.currentState?.fields['package']?.value as List;

      if (value[0] == true) {
        _adcontroller.postAd(model.copyWith(isFeatured: true));

        Database.updatePackage(
          PackageModel(
            docId: value[1] as String,
            remainingAdsLimit: --value[2] as int,
          ),
        );
      } else {
        _adcontroller.postAd(model.copyWith(isFeatured: false));
      }
    }
  }
}
