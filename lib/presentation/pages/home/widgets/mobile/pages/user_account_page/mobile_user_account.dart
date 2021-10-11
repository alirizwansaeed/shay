import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/constants/screen_constraints.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/user_verification/user_verification_page.dart';
import '../../../../../pages.dart';

class MobileUserAccount extends StatelessWidget {
  MobileUserAccount({Key? key}) : super(key: key);
  final _authController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: MobileAppbar(
            title: 'Account',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ScreenConstants.devicePadding),
                child: _authController.currentUserState == null
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                            onPressed: _login,
                            icon: Icon(Icons.login_outlined),
                            label: Text('login')),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            backgroundImage: AssetImage(Assets.avatar),
                            child: Stack(
                              fit: StackFit.expand,
                              clipBehavior: Clip.none,
                              children: [
                                if (Get.find<UserController>()
                                        .currentUserStream
                                        .profilePicture !=
                                    null)
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: Get.find<UserController>()
                                          .currentUserStream
                                          .profilePicture!,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                Positioned(
                                    right: -10,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstants.primaryColor,
                                      ),
                                      child: IconButton(
                                          onPressed: () async {
                                            await Get.find<UserController>()
                                                .changeProfilePicture();
                                          },
                                          icon:
                                              FaIcon(FontAwesomeIcons.camera)),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    Get.find<UserController>()
                                            .currentUserStream
                                            .displayName ??
                                        'Shay User',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: _editProfileButton,
                                    icon: Icon(Icons.edit))
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              if (_authController.currentUser != null)
                Column(
                  children: [
                    customTile(
                        title: 'Buy Packages',
                        leading: Icons.credit_card,
                        onTap: () => Get.toNamed(ChoosePakagePage.routeName)),
                    customTile(
                        title: 'Settings',
                        leading: Icons.settings,
                        subTitle: 'Change password',
                        onTap: () => Get.toNamed(SettingsPage.routeName)),
                  ],
                ),
              customTile(
                  title: 'Help And Support',
                  leading: Icons.help_center_outlined,
                  subTitle: 'Contact Us, Help and FAQs ',
                  onTap: () => Get.toNamed(HelpAndSupportPage.routeName)),
              if (_authController.currentUser != null)
                customTile(
                  title: 'Logout',
                  leading: Icons.logout,
                  onTap: () {
                    _authController.signOut();
                    Get.offAllNamed(HomePage.routeName);
                  },
                ),
            ],
          ),
        ));
  }

  void _editProfileButton() async {
    if (await _authController.isEmailVerified())
      Get.toNamed(EditUserProfilepage.routeName);
    else
      Get.toNamed(UserVerificationPage.routeName);
  }

  void _login() async {
    if (_authController.currentUserState == null)
      return Get.toNamed(LoginPage.routeName);
    if (!await _authController.isEmailVerified())
      return Get.toNamed(UserVerificationPage.routeName);
    else
      return Get.toNamed(PostAdCategoryPage.routeName);
  }
}
