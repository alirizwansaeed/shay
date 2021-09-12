import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shay/constants/user_fields.dart';

class UserModel {
  late String userid;
  late String name;
  late String email;
  late String? photoUrl;
  UserModel({
    required this.userid,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    userid = snapshot.id;
    name = snapshot[UserFieldsConstants.name];
    email = snapshot[UserFieldsConstants.email];
    photoUrl = snapshot[UserFieldsConstants.photoUrl]??null;
  }
}
