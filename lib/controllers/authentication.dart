import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/database.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> _currentUser = Rx<User?>(null);
  String? get currentUserId {
    return _currentUser.value?.uid;
  }

  @override
  void onInit() async {
    _currentUser.bindStream(_auth.authStateChanges());
    if (GetPlatform.isWeb) await _auth.setPersistence(Persistence.LOCAL);
    _auth.authStateChanges().listen((event) {
      print(event);
    });
    super.onInit();
  }

  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Get.back();
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.code}",
      ));
    } catch (e) {
      print(e);
    }
  }

// create user  with email password
  Future<void> createUserWithEmailPassword(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel _user = UserModel(
          userid: userCredential.user!.uid,
          name: userName,
          email: userCredential.user!.email!);

      /// create user in database
      await Database().createUser(_user);
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.message}",
      ));
    } catch (e) {
      print(e);
    }
  }

//Login with google
  Future<void> signInWithGoogle() async {
    try {
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
        userid: userCredential.user!.uid,
        name: userCredential.user!.displayName!,
        email: userCredential.user!.email!,
        photoUrl: userCredential.user!.photoURL,
      );
// create user in database
      await Database().createUser(_user);

      // badk to previous page
      Get.back();
    } on PlatformException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "${e.code}",
      ));
    } catch (e) {
      print(e);
    }
  }

// login with facebook

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e);
    }
  }

// Forget Password

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.showSnackbar(GetBar(
        title: 'Rest password sent to',
        message: email,
      ));
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: '${e.code}',
      ));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updatePassword() async {}
}
