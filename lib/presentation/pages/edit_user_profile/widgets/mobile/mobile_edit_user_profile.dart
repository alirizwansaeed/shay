import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shay/constants/strings.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class MobileEditUserProfile extends StatelessWidget {
  MobileEditUserProfile({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final _currentUser = Get.find<CurrentUserController>().currentUserStream;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: "Edit Profile",
        actions: [TextButton(onPressed: updateUser, child: Text('Save'))],
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerText('Basic Information'),
                  formBuilerText(Strings.userDisplayName, topPadding: 0),
                  FormBuilderTextField(
                      name: Strings.userDisplayName,
                      initialValue: _currentUser.displayName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(context),
                      maxLength: 30,
                      decoration: formFieldDecoration),
                  formBuilerText(Strings.userBiography, topPadding: 0),
                  FormBuilderTextField(
                    name: Strings.userBiography,
                    initialValue: _currentUser.biography,
                    maxLength: 500,
                    maxLines: 3,
                    decoration: formFieldDecoration.copyWith(
                      contentPadding: EdgeInsets.all(10),
                      helperText: 'Tell something intresting about yourself',
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.red),
                  headerText('Contact Detail'),
                  formBuilerText(Strings.userMobileNumber, topPadding: 0),
                  FormBuilderTextField(
                    name: Strings.userMobileNumber,
                    initialValue: _currentUser.mobileNumber,
                    maxLength: 11,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.userWebsite, topPadding: 0),
                  FormBuilderTextField(
                    name: Strings.userWebsite,
                    initialValue: _currentUser.website,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.userEmail),
                  FormBuilderTextField(
                    name: Strings.userEmail,
                    initialValue: _currentUser.email,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.userAddress),
                  FormBuilderTextField(
                    name: Strings.userAddress,
                    initialValue: _currentUser.address,
                    decoration: formFieldDecoration,
                  ),
                  SizedBox(height: 25),
                  Divider(color: Colors.red),
                  headerText('SOCIAL PROFILE LINK'),
                  formBuilerText(Strings.facebook, topPadding: 0),
                  FormBuilderTextField(
                    name: Strings.facebook,
                    initialValue: _currentUser.facebook,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.twitter),
                  FormBuilderTextField(
                    name: Strings.twitter,
                    initialValue: _currentUser.twitter,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.instagram),
                  FormBuilderTextField(
                    name: Strings.instagram,
                    initialValue: _currentUser.instagram,
                    decoration: formFieldDecoration,
                  ),
                  formBuilerText(Strings.youtube),
                  FormBuilderTextField(
                    name: Strings.youtube,
                    initialValue: _currentUser.youtube,
                    decoration: formFieldDecoration,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void updateUser() {
    if (_formKey.currentState!.validate()) {
      FormBuilderState? _formState = _formKey.currentState;
      UserModel userModel = UserModel(
        displayName: _formState!.fields[Strings.userDisplayName]!.value,
        biography: _formState.fields[Strings.userBiography]!.value,
        mobileNumber: _formState.fields[Strings.userMobileNumber]!.value,
        website: _formState.fields[Strings.userWebsite]!.value,
        email: _formState.fields[Strings.userEmail]!.value,
        address: _formState.fields[Strings.userAddress]!.value,
        facebook: _formState.fields[Strings.facebook]!.value,
        twitter: _formState.fields[Strings.twitter]!.value,
        instagram: _formState.fields[Strings.instagram]!.value,
        youtube: _formState.fields[Strings.youtube]!.value,
      );
      Get.find<DatabaseController>().updateUser(userModel);
      Get.back();
    }
  }
}
