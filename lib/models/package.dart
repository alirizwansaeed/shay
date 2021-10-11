import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shay/constants/constants.dart';

class PackageModel {
  late String? uid;
  late String? packageName;
  late String? packageType;
  late Timestamp? packageExpiryDate;
  late int? packagePrice;
  late int? maxAdsLimit;
  late int? remainingAdsLimit;
  late String? docId;
  late int? validForDays;
  PackageModel({
    this.uid,
    this.packageName,
    this.packageType,
    this.packageExpiryDate,
    this.packagePrice,
    this.maxAdsLimit,
    this.remainingAdsLimit,
    this.docId,
    this.validForDays,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PackageModel &&
        other.uid == uid &&
        other.packageName == packageName &&
        other.packageType == packageType &&
        other.packageExpiryDate == packageExpiryDate &&
        other.packagePrice == packagePrice &&
        other.maxAdsLimit == maxAdsLimit &&
        other.remainingAdsLimit == remainingAdsLimit &&
        other.docId == docId &&
        other.validForDays == validForDays;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        packageName.hashCode ^
        packageType.hashCode ^
        packageExpiryDate.hashCode ^
        packagePrice.hashCode ^
        maxAdsLimit.hashCode ^
        remainingAdsLimit.hashCode ^
        docId.hashCode ^
        validForDays.hashCode;
  }

  PackageModel copyWith({
    String? uid,
    String? packageName,
    String? packageType,
    Timestamp? packageExpiryDate,
    int? packagePrice,
    int? maxAdsLimit,
    int? remainingAdsLimit,
    String? docId,
    int? validForDays,
  }) {
    return PackageModel(
      uid: uid ?? this.uid,
      packageName: packageName ?? this.packageName,
      packageType: packageType ?? this.packageType,
      packageExpiryDate: packageExpiryDate ?? this.packageExpiryDate,
      packagePrice: packagePrice ?? this.packagePrice,
      maxAdsLimit: maxAdsLimit ?? this.maxAdsLimit,
      remainingAdsLimit: remainingAdsLimit ?? this.remainingAdsLimit,
      docId: docId ?? this.docId,
      validForDays: validForDays ?? this.validForDays,
    );
  }

  PackageModel.formsnapshot(DocumentSnapshot snapshot) {
    docId = snapshot.id;
    uid = snapshot[Strings.userId];
    packageName = snapshot[Strings.packageName];
    packageType = snapshot[Strings.packageType];
    packageExpiryDate = snapshot[Strings.PackageExpiryDate];
    packagePrice = snapshot[Strings.packagePrice];
    maxAdsLimit = snapshot[Strings.maxAdsLimit];
    remainingAdsLimit = snapshot[Strings.remainingAdsLimit];
    validForDays = snapshot[Strings.validForDays];
  }
}
