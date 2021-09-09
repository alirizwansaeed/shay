import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/user_fields.dart';
import 'package:shay/models/models.dart';

class Database {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //user collection
  CollectionReference get _userCollection {
    return _db.collection(UserFields.collectionName);
  }

  Future<void> createUser(UserModel userModel) async {
    DocumentReference _userDocument = _userCollection.doc(userModel.userid);
    //get snapshot of document
    DocumentSnapshot _snapshot = await _userDocument.get();
    // if user record  not exist then add user record
    if (!_snapshot.exists) {
      _userDocument.set({
        UserFields.uid: userModel.userid,
        UserFields.name: userModel.name,
        UserFields.email: userModel.email,
        UserFields.photoUrl:userModel.photoUrl
      });
    }
  }
}
