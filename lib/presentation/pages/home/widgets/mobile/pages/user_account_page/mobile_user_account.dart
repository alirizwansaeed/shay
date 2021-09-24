import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/assets_icons.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/controllers/controllers.dart';

import '../../../../../pages.dart';

class MobileUserAccount extends StatelessWidget {
  MobileUserAccount({Key? key}) : super(key: key);
  final _authController = Get.find<AuthenticationController>();
  final _databaseController = Get.find<DatabaseController>();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: ScreenConstants.devicePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Obx(
            () => _authController.currentUserState == null
                ? SizedBox.shrink()
                : Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        backgroundImage:
                            AssetImage(AssetsIconsConstants.avatar),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          _databaseController.userStream.name ?? 'Shay User',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.toNamed(EditUserProfilepage.routeName),
                          icon: Icon(Icons.edit))
                    ],
                  ),
          ),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: _authController.currentUserState != null
                  ? ElevatedButton(
                      onPressed: () {
                        _authController.signOut();
                      },
                      child: Text("Sign out"))
                  : ElevatedButton(
                      onPressed: () async {
                        if (_authController.currentUserState == null)
                          return Get.toNamed(LoginPage.routeName);
                        if (await _authController.isEmailVerified())
                          return Get.toNamed(PostNewAdPage.routeName);
                        if (!await _authController.isEmailVerified())
                          return Get.toNamed(UserVerificationPage.routeName);
                        else
                          return Get.toNamed(PostNewAdPage.routeName);
                      },
                      child: Text('Login or Register'),
                    ),
            ),
          )
        ],
      ),
    );
  }

  void _updateUserName() {
    Get.bottomSheet(BottomSheet(
      onClosing: () {},
      builder: (context) => Padding(
        padding: EdgeInsets.all(ScreenConstants.devicePadding),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                name: 'name',
                maxLength: 25,
                initialValue: _databaseController.userStream.name,
                validator: FormBuilderValidators.required(context),
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _databaseController.updateUserName(
                            _formKey.currentState!.fields['name']!.value);
                        Get.back();
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
