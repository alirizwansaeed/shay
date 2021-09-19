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

  static Future<void> createUser(UserModel userModel) async {
    DocumentReference _userDocument = _usersCollection.doc(userModel.uid);
    //get snapshot of document
    DocumentSnapshot _snapshot = await _userDocument.get();
    // if user record  not exist then add user record
    if (!_snapshot.exists) {
      _userDocument.set(
        {
          UserFieldsConstants.uid: userModel.uid,
          UserFieldsConstants.name: userModel.name,
          UserFieldsConstants.creationdate: userModel.creationdate
        },
      );
    }
  }

  static Future<void> updateUserName(
      {required String uid, required String name}) async {
    await _usersCollection.doc(uid).update({
      UserFieldsConstants.name: name,
    });
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
  static Stream<UserModel> userNameStream(String uid) {
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
