import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

///show snackbar if login successful
           Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "login successful",
      ));
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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);


           Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "Signup successful",
      ));
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

           Get.showSnackbar(GetBar(
        duration: const Duration(seconds: 2),
        titleText: SizedBox.shrink(),
        message: "Loged in as ${userCredential.user!.displayName}",
      ));
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
      await auth.sendPasswordResetEmail(email: email);
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
}
