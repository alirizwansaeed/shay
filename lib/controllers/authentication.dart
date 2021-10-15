import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/helper/auth_excepitons.dart';
import 'package:shay/models/models.dart';
import 'package:shay/presentation/pages/pages.dart';
import 'package:shay/services/auth.dart';
import 'package:shay/services/services.dart';
import 'package:shay/utils/dialogs.dart';

class AuthenticationController extends GetxController with CustomExceptions {
  /// declare user
  Rx<User?> _currentuserState = Rx(null);

  FirebaseAuth get _auth {
    return Auth.auth;
  }

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
    ever(_currentuserState, (callback) {
      if (currentUserState == null) {
        Get.delete<UserController>();
      }
    });

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
      Dialogs.loading();
      await Auth.signInWithEmail(email: email, password: password);
      Dialogs.toast('Login successfully');
      Get.back();
    } catch (e) {
      authError(e);
    } finally {
      Dialogs.closeLoading();
    }
  }

  Future<void> createUserWithEmailPassword(
      {required String username,
      required String email,
      required String password}) async {
    try {
      Dialogs.loading();
      UserCredential _userCredential = await Auth.createUserWithEmailPassword(
          email: email, password: password);

      await _userCredential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        isVarified: false,
        displayName: username,
        uid: _userCredential.user!.uid,
        creationdate: Timestamp.fromDate(
          _userCredential.user!.metadata.creationTime!,
        ),
      );

      await Database.createNewUser(userModel);
      Get.toNamed(UserVerificationPage.routeName);
    } catch (e) {
      authError(e);
    } finally {
      Dialogs.closeLoading();
    }
  }

//Login with google
  Future<void> signInWithGoogle() async {
    try {
      UserCredential userCredential = await Auth.signInWithGoogle();

      await Database.createNewUser(UserModel(
        isVarified: true,
        profilePicture: userCredential.user!.photoURL,
        uid: userCredential.user?.uid,
        displayName: userCredential.user?.displayName!,
        creationdate:
            Timestamp.fromDate(userCredential.user!.metadata.creationTime!),
      ));
      Get.back();
      Dialogs.toast('Login Successfully');
    } on Exception catch (e) {
      authError(e);
    }
  }

// login with facebook

  Future<void> signInWithFacebook() async {
    try {
      UserCredential _userCredential = await Auth.signInWithFacebook();

      Database.createNewUser(UserModel(
        isVarified: true,
        profilePicture: _userCredential.user!.photoURL,
        uid: _userCredential.user!.uid,
        displayName: _userCredential.user!.displayName!,
        creationdate:
            Timestamp.fromDate(_userCredential.user!.metadata.creationTime!),
      ));
      Get.back();
      Dialogs.toast('Login Successfully');
    } on Exception catch (e) {
      authError(e);
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      Dialogs.loading();
      await _auth.sendPasswordResetEmail(email: email);

      Dialogs.closeLoading();
      Get.close(2);
      await Dialogs.successDialog('Password Sent Sucessfully');
    } on Exception catch (e) {
      authError(e);
    } finally {
      Dialogs.closeLoading();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      var emailAuthProvider = EmailAuthProvider.credential(
          email: currentUser!.email!, password: currentPassword);

      await currentUser!.reauthenticateWithCredential(emailAuthProvider);
      await currentUser!.updatePassword(newPassword);
    } on Exception catch (e) {
      authError(e);
    }
  }

  Future<bool> isEmailVerified() async {
    if (_auth.currentUser!.providerData
        .every((element) => element.providerId != 'password')) return true;

    if (_auth.currentUser!.emailVerified &&
        (_auth.currentUser!.providerData
            .every((element) => element.providerId == 'password'))) return true;

    await _auth.currentUser!.reload();

    if (_auth.currentUser!.emailVerified &&
        (_auth.currentUser!.providerData
            .every((element) => element.providerId == 'password'))) {
      Database.updateUser(UserModel(isVarified: true, uid: currentUser!.uid));
      return true;
    }

    if (!_auth.currentUser!.emailVerified &&
        (_auth.currentUser!.providerData
            .every((element) => element.providerId == 'password')))
      return false;

    return true;
  }
}
