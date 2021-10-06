import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shay/constants/constants.dart';
import 'package:shay/constants/user_fields.dart';

class AdModel {
  late String? uid;
  late String? category;
  late String? subCategory;
  late String? type;
  late String? title;
  late String? description;
  late String? price;
  late String? mobileNumber;
  late String? itemCondition;
  late String? city;
  late bool? isFeatured;
  late String? status;
  late Map<String, dynamic>? photos;
  late String? videoUrl;
  late Timestamp? date;
  late String? docId;
  late int? adId;

  AdModel({
    this.uid,
    this.category,
    this.type,
    this.title,
    this.description,
    this.price,
    this.mobileNumber,
    this.itemCondition,
    this.city,
    this.isFeatured,
    this.status,
    this.photos,
    this.date,
    this.videoUrl,
    this.subCategory,
    this.docId,
    this.adId,
  });

  AdModel copyWith({
    String? uid,
    String? category,
    String? type,
    String? title,
    String? description,
    String? price,
    String? mobileNumber,
    String? itemCondition,
    String? city,
    String? videoUrl,
    bool? isFeatured,
    String? status,
    Map<String, dynamic>? photos,
    Timestamp? date,
    String? subCategory,
    String? docId,
    int? adId,
  }) {
    return AdModel(
      uid: uid ?? this.uid,
      category: category ?? this.category,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      itemCondition: itemCondition ?? this.itemCondition,
      city: city ?? this.city,
      isFeatured: isFeatured ?? this.isFeatured,
      status: status ?? this.status,
      photos: photos ?? this.photos,
      date: date ?? this.date,
      videoUrl: videoUrl ?? this.videoUrl,
      subCategory: subCategory ?? this.subCategory,
      docId: docId ?? this.docId,
      adId: adId ?? this.adId,
    );
  }

  AdModel.fromsnapshot(DocumentSnapshot snapshot) {
    uid = snapshot[UserFieldsConstants.uid];
    category = snapshot[PostNewAdConstants.category];
    city = snapshot[PostNewAdConstants.city];
    description = snapshot[PostNewAdConstants.description];
    isFeatured = snapshot[PostNewAdConstants.Isfeatured];
    itemCondition = snapshot[PostNewAdConstants.itemCondition];
    mobileNumber = snapshot[PostNewAdConstants.mobileNumber];
    photos = snapshot[PostNewAdConstants.photos];
    price = snapshot[PostNewAdConstants.price];
    status = snapshot[PostNewAdConstants.status];
    title = snapshot[PostNewAdConstants.title];
    type = snapshot[PostNewAdConstants.type];
    date = snapshot[PostNewAdConstants.date];
    videoUrl = snapshot[PostNewAdConstants.videoUrl];
    subCategory = snapshot[PostNewAdConstants.subCategory];
    docId = snapshot.id;
    adId = snapshot[Strings.adId];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdModel &&
      other.uid == uid &&
      other.category == category &&
      other.subCategory == subCategory &&
      other.type == type &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.mobileNumber == mobileNumber &&
      other.itemCondition == itemCondition &&
      other.city == city &&
      other.isFeatured == isFeatured &&
      other.status == status &&
      other.photos == photos &&
      other.videoUrl == videoUrl &&
      other.date == date &&
      other.docId == docId &&
      other.adId == adId;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      category.hashCode ^
      subCategory.hashCode ^
      type.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      mobileNumber.hashCode ^
      itemCondition.hashCode ^
      city.hashCode ^
      isFeatured.hashCode ^
      status.hashCode ^
      photos.hashCode ^
      videoUrl.hashCode ^
      date.hashCode ^
      docId.hashCode ^
      adId.hashCode;
  }
}
