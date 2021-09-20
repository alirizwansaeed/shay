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
                        // child: Stack(
                        //   clipBehavior: Clip.none,
                        //   children: [
                        //     Positioned(
                        //       right: -2,
                        //       bottom: -6,
                        //       child: InkWell(
                        //         onTap: () {},
                        //         child: Container(
                        //             padding: const EdgeInsets.all(6),
                        //             decoration: BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: Colors.blue,
                        //             ),
                        //             child: Icon(
                        //               Icons.camera,
                        //               color: Colors.white,
                        //             )),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                          onPressed: _updateUserName, icon: Icon(Icons.edit))
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
          // _authenticationController.currentUserState == null
          //     ? TextButton(
          //         onPressed: () async {
          //           if (_authenticationController.currentUserState == null)
          //             return Get.toNamed(LoginPage.routeName);
          //           if (await _authenticationController.isEmailVerified())
          //             return Get.toNamed(PostNewAdPage.routeName);
          //           if (!await _authenticationController.isEmailVerified())
          //             return Get.toNamed(UserVerificationPage.routeName);
          //           else
          //             return Get.toNamed(PostNewAdPage.routeName);
          //         },
          //         child: Text('Login'))
          //     : TextButton(
          //         onPressed: () {
          //           _authenticationController.signOut();
          //         },
          //         child: Text("Sign out")),
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
