import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shay/controllers/controllers.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  /// declare user
  Rx<User?> _currentuserState = Rx(null);

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
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

// create user  with email password
  Future<void> createUserWithEmailPassword(
      {required String username,
      required String email,
      required String password}) async {
    UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _userCredential.user?.sendEmailVerification();
    UserModel userModel = UserModel(
      isVarified: false,
      displayName: username,
      uid: _userCredential.user!.uid,
      creationdate: Timestamp.fromDate(
        _userCredential.user!.metadata.creationTime!,
      ),
    );
    await Database.createNewUser(userModel);
  }

//Login with google
  Future<void> signInWithGoogle() async {
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
      isVarified: true,
      uid: userCredential.user?.uid,
      displayName: userCredential.user?.displayName!,
      creationdate:
          Timestamp.fromDate(userCredential.user!.metadata.creationTime!),
    );
    // create user in database
    await Database.createNewUser(_user);
  }

// login with facebook

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(loginBehavior: LoginBehavior.dialogOnly);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    UserCredential _userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    UserModel _userModel = UserModel(
      isVarified: true,
      uid: _userCredential.user!.uid,
      displayName: _userCredential.user!.displayName!,
      creationdate:
          Timestamp.fromDate(_userCredential.user!.metadata.creationTime!),
    );
    Database.createNewUser(_userModel);
  }

// Forget Password

  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
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

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> changePassword(
      {required String currentPassword, required String newPassword}) async {
    var emailAuthProvider = EmailAuthProvider.credential(
        email: currentUser!.email!, password: currentPassword);

    await currentUser!.reauthenticateWithCredential(emailAuthProvider);
    await currentUser!.updatePassword(newPassword);
  }
}
