import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/pages/pages.dart';
import 'package:shay/services/services.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  /// declare user
  Rx<User?> _currentuserState = Rx<User?>(null);

  ///
  ///loading state
  var isLoading = false.obs;

  ///getting the value of current user
  ///if value if null mean user not loged in
  User? get currentUserState {
    return _currentuserState.value;
  }

  User? get currentUser {
    return _auth.currentUser;
  }

  @override
  void onInit() async {
    //initilize value to current user
    _currentuserState(_auth.currentUser);
    //bind stream to current user
    //for listening the current state of user
    _currentuserState.bindStream(_auth.authStateChanges());
    // this only work in webb
    if (GetPlatform.isWeb) await _auth.setPersistence(Persistence.LOCAL);

    super.onInit();
  }

  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      isLoading(true);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.back(closeOverlays: true);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.code}",
      ));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

// create user  with email password
  Future<void> createUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      isLoading(true);
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _userCredential.user?.sendEmailVerification();
      Get.close(2);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetBar(
          duration: const Duration(seconds: 2),
          titleText: SizedBox.shrink(),
          message: "${e.message}",
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

//Login with google
  Future<void> signInWithGoogle() async {
    try {
      isLoading(true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      ///map data to model
      UserModel _user = UserModel(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName!,
        creationdate: Timestamp.fromDate(userCredential.user!.metadata.creationTime!),
      );
      // create user in database
      await Database.createUser(_user);
      Get.back(closeOverlays: true);
    } on PlatformException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.code}",
      ));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

// login with facebook

  Future<void> signInWithFacebook() async {
    try {
      isLoading(true);
      final LoginResult result = await FacebookAuth.instance
          .login(loginBehavior: LoginBehavior.dialogOnly);

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      UserCredential _userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      UserModel _userModel = UserModel(
        uid: _userCredential.user!.uid,
        name: _userCredential.user!.displayName!,
        creationdate: Timestamp.fromDate(_userCredential.user!.metadata.creationTime!),
      );
      Database.createUser(_userModel);
      Get.back();
    } on PlatformException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.code}",
      ));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

// Forget Password

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.close(2);
      Get.showSnackbar(GetBar(
          title: 'Rest password sent to',
          message: email,
          duration: const Duration(seconds: 3)));
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: '${e.code}',
      ));
    }
  }

  Future<bool> isEmailVerified() async {
    ///check if the user created with email is verified or not
    ///if verified return true;

    if (_auth.currentUser!.emailVerified &&
        _auth.currentUser!.providerData[0].providerId == 'password')
      return true;

    if (_auth.currentUser!.providerData[0].providerId == 'google.com' ||
        _auth.currentUser!.providerData[0].providerId == 'facebook.com')
      return true;

    //reload the state of user
    await _auth.currentUser!.reload();
    // recheck if verified create user in database
    if (_auth.currentUser!.emailVerified &&
        _auth.currentUser!.providerData[0].providerId == 'password') {
      UserModel userModel =
          UserModel(uid: _auth.currentUser!.uid, name: 'Shay User',creationdate:Timestamp.fromDate(_auth.currentUser!.metadata.creationTime!), );
      await Database.createUser(userModel);
      return true;
    }
    //recheck if user is not verified then return fasle
    if (!_auth.currentUser!.emailVerified &&
        _auth.currentUser!.providerData[0].providerId == 'password') {
      return false;
      // user created with third parties is always true and verified
    } else
      return true;
  }

  Future<void> signOut() async {
    Get.offAllNamed(HomePage.routeName);
    await _auth.signOut();
  }
}
