import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shay/constants/user_fields.dart';

class UserModel {
  late String? uid;
  late String? name;
  late Timestamp? creationdate;
  UserModel({
   this.uid,
     this.name,
   this.creationdate,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot.id;
    name = snapshot[UserFieldsConstants.name];
    creationdate = snapshot[UserFieldsConstants.creationdate];
  }
}
