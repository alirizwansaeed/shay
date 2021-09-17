import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/user_fields.dart';

class UserModel {
  late String? uid;
  late String? name;
  UserModel({
    this.uid,
    required this.name,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    name = snapshot[UserFieldsConstants.name];
  }
}
