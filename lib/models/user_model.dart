import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shay/constants/user_fields.dart';

class UserModel {
  late String uid;
  late String name;
  late String? photoUrl;
  UserModel({
    required this.uid,
    required this.name,
    this.photoUrl,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    name = snapshot[UserFieldsConstants.name];
    photoUrl = snapshot[UserFieldsConstants.photoUrl]??null;
  }
}
