import 'package:firebase_auth/firebase_auth.dart';
import 'package:shay/utils/dialogs.dart';

class CustomExceptions {
  Future<void> authError(error) async {
    if (error is FirebaseAuthException) {
      if (error.code == 'user-not-found') {
        Dialogs.errorDialog('User Not Avaliable');
      } else if (error.code == 'weak-password') {
        Dialogs.errorDialog('The password provided is too weak');
      } else if (error.code == 'email-already-in-use') {
        Dialogs.errorDialog("The account already exists for that email");
      } else if (error.code == 'invalid-email') {
        Dialogs.errorDialog('Email badly formated');
      } else if (error.code == 'wrong-password') {
        Dialogs.errorDialog('Wrong Password');
      } else {
        Dialogs.errorDialog(error.toString());
      }
    } else {
      Dialogs.errorDialog(error.toString());
    }
  }
}
