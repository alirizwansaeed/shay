import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = 'editprofile';
  final username = 'User Name';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppbar(
        title: 'Edit Profile',
        actions: [TextButton(onPressed: () {}, child: Text('Save'))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ScreenConstants.devicePadding),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundImage: AssetImage(AssetsIconsConstants.avatar),
                ),
                FormBuilder(child: FormBuilderTextField(name: ''))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
