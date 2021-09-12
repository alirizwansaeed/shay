import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/constants/user_fields.dart';
import 'package:shay/models/models.dart';
import 'package:shay/models/post_new_ad.dart';

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
    DocumentReference _userDocument = _usersCollection.doc(userModel.userid);
    //get snapshot of document
    DocumentSnapshot _snapshot = await _userDocument.get();
    // if user record  not exist then add user record
    if (!_snapshot.exists) {
      _userDocument.set({
        UserFieldsConstants.uid: userModel.userid,
        UserFieldsConstants.name: userModel.name,
        UserFieldsConstants.email: userModel.email,
        UserFieldsConstants.photoUrl: userModel.photoUrl
      });
    }
  }

  static Future<void> postNewAdd(PostNewAdModel model) async {
    await _postsCollection.doc().set({
      UserFieldsConstants.uid:model.uid,
      PostNewAdConstants.category:model.category,
      PostNewAdConstants.title:model.title,
      PostNewAdConstants.description:model.description,
      PostNewAdConstants.city:model.city,
      PostNewAdConstants.itemCondition:model.itemCondition,
      PostNewAdConstants.mobileNumber:model.mobileNumber,
      PostNewAdConstants.photos:model.photos,
      PostNewAdConstants.price:model.price,
      PostNewAdConstants.type:model.type,
      PostNewAdConstants.Isfeatured:model.isFeatured,
      PostNewAdConstants.status:model.status,





    });
  }
}
