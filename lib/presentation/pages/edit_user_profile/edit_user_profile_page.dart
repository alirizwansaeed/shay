import 'package:flutter/material.dart';
import 'package:shay/presentation/pages/edit_user_profile/widgets/mobile/mobile_edit_user_profile.dart';

class EditUserProfilepage extends StatelessWidget {
  static const routeName = 'edituserprofile';

  const EditUserProfilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileEditUserProfile();
  }
}
