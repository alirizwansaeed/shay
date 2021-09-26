import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/constants/user_fields.dart';
import 'package:shay/models/models.dart';
import 'package:shay/models/ad.dart';

class Database {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  //user collection
  static CollectionReference get _usersCollection {
    return _db.collection('users');
  }

  static CollectionReference get _postsCollection {
    return _db.collection('posts');
  }

  static Future<void> createNewUser(UserModel userModel) async {
    DocumentReference _userDocument = _usersCollection.doc(userModel.uid);
    //get snapshot of document
    DocumentSnapshot _snapshot = await _userDocument.get();
    // if user record  not exist then add user record
    if (!_snapshot.exists) {
      _userDocument.set(
        {
          Strings.userId: userModel.uid,
          Strings.userDisplayName: userModel.displayName,
          Strings.userBiography: userModel.biography,
          Strings.userMobileNumber: userModel.mobileNumber,
          Strings.userWebsite: userModel.website,
          Strings.userEmail: userModel.email,
          Strings.userAddress: userModel.address,
          Strings.facebook: userModel.facebook,
          Strings.twitter: userModel.twitter,
          Strings.instagram: userModel.instagram,
          Strings.youtube: userModel.youtube,
          Strings.userCreationDate: userModel.creationdate,
          Strings.isVarified: userModel.isVarified,
        },
      );
    }
  }

  static Future<void> updateUser(UserModel userModel) async {
    await _usersCollection.doc(userModel.uid).update(
      {
        if (userModel.displayName != null)
          Strings.userDisplayName: userModel.displayName,
        if (userModel.biography != null)
          Strings.userBiography: userModel.biography,
        if (userModel.mobileNumber != null)
          Strings.userMobileNumber: userModel.mobileNumber,
        if (userModel.website != null) Strings.userWebsite: userModel.website,
        if (userModel.email != null) Strings.userEmail: userModel.email,
        if (userModel.address != null) Strings.userAddress: userModel.address,
        if (userModel.facebook != null) Strings.facebook: userModel.facebook,
        if (userModel.twitter != null) Strings.twitter: userModel.twitter,
        if (userModel.instagram != null) Strings.instagram: userModel.instagram,
        if (userModel.youtube != null) Strings.youtube: userModel.youtube,
        if (userModel.isVarified != null)
          Strings.isVarified: userModel.isVarified
      },
    );
  }

  static Future<UserModel> fetchSpecificUser(String documentid) async {
    return _usersCollection
        .doc(documentid)
        .get()
        .then((value) => UserModel.fromSnapshot(value));
  }

  static Future<void> postNewAdd(AdModel model) async {
    await _postsCollection.doc().set({
      UserFieldsConstants.uid: model.uid,
      PostNewAdConstants.category: model.category,
      PostNewAdConstants.title: model.title,
      PostNewAdConstants.description: model.description,
      PostNewAdConstants.city: model.city,
      PostNewAdConstants.itemCondition: model.itemCondition,
      PostNewAdConstants.mobileNumber: model.mobileNumber,
      PostNewAdConstants.photos: model.photos,
      PostNewAdConstants.price: model.price,
      PostNewAdConstants.type: model.type,
      PostNewAdConstants.Isfeatured: model.isFeatured,
      PostNewAdConstants.status: model.status,
      PostNewAdConstants.date: DateTime.now(),
      PostNewAdConstants.subCategory: model.subCategory
    });
  }

  //userdata stream
  static Stream<UserModel> currentuserStream(String uid) {
    return _usersCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => UserModel.fromSnapshot(snapshot));
  }

  static Stream<List<AdModel>> adsStream() {
    return _postsCollection.snapshots().map((event) {
      List<AdModel> retval = [];
      event.docs.forEach((element) {
        retval.add(AdModel.fromsnapshot(element));
      });
      return retval;
    });
  }
}
