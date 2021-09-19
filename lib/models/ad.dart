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
  late Timestamp? date;

  AdModel(
      {this.uid,
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
      this.subCategory});

  AdModel copyWith(
      {String? uid,
      String? category,
      String? type,
      String? title,
      String? description,
      String? price,
      String? mobileNumber,
      String? itemCondition,
      String? city,
      bool? isFeatured,
      String? status,
      Map<String, dynamic>? photos,
      Timestamp? date,
      String? subCategory}) {
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
        subCategory: subCategory ?? this.subCategory);
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
    subCategory =
        snapshot.data().toString().contains(PostNewAdConstants.subCategory)
            ? snapshot[PostNewAdConstants.subCategory]
            : '';
  }
}
