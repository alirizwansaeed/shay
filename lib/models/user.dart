import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/constants.dart';

class UserModel {
  late String? uid;
  late String? displayName;
  late String? biography;
  late String? mobileNumber;
  late String? website;
  late String? email;
  late String? address;
  late String? facebook;
  late String? twitter;
  late String? instagram;
  late String? youtube;
  late bool? isVarified;
  late Timestamp? creationdate;

  UserModel({
    this.uid,
    this.displayName,
    this.biography,
    this.mobileNumber,
    this.website,
    this.email,
    this.address,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.creationdate,
    this.isVarified,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    uid = snapshot[Strings.userId];
    displayName = snapshot[Strings.userDisplayName];
    biography = snapshot[Strings.userBiography];
    mobileNumber = snapshot[Strings.userMobileNumber];
    website = snapshot[Strings.userWebsite];
    email = snapshot[Strings.userEmail];
    address = snapshot[Strings.userAddress];
    facebook = snapshot[Strings.facebook];
    twitter = snapshot[Strings.twitter];
    instagram = snapshot[Strings.instagram];
    youtube = snapshot[Strings.youtube];
    isVarified = snapshot[Strings.isVarified];
    creationdate = snapshot[Strings.userCreationDate];
  }

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? biography,
    String? mobileNumber,
    String? website,
    String? email,
    String? address,
    String? facebook,
    String? twitter,
    String? instagram,
    String? youtube,
    bool? isVarified,
    Timestamp? creationdate,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      biography: biography ?? this.biography,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      website: website ?? this.website,
      email: email ?? this.email,
      address: address ?? this.address,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      instagram: instagram ?? this.instagram,
      youtube: youtube ?? this.youtube,
      isVarified: isVarified ?? this.isVarified,
      creationdate: creationdate ?? this.creationdate,
    );
  }
}
