import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/models/models.dart';

enum PackageName {
  novice,
  pro,
  executive,
}

class PackagesList {
  static Map<PackageName, PackageModel> silver = {
    PackageName.novice: PackageModel(
      packageName: 'SILVER',
      maxAdsLimit: 1,
      remainingAdsLimit: 1,
      validForDays: 7,
      packageType: 'Novice',
      packagePrice: 10,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 7),
        ),
      ),
    ),
    PackageName.pro: PackageModel(
      packageName: 'SILVER',
      maxAdsLimit: 2,
      remainingAdsLimit: 2,
      validForDays: 7,
      packageType: 'Pro',
      packagePrice: 650,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 7),
        ),
      ),
    ),
    PackageName.executive: PackageModel(
      packageName: 'SILVER',
      maxAdsLimit: 4,
      remainingAdsLimit: 4,
      packageType: 'Executive',
      validForDays: 7,
      packagePrice: 1200,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 7),
        ),
      ),
    ),
  };
  static Map<PackageName, PackageModel> gold = {
    PackageName.novice: PackageModel(
      packageName: 'GOLD',
      maxAdsLimit: 1,
      remainingAdsLimit: 1,
      packageType: 'Novice',
      validForDays: 14,
      packagePrice: 850,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 14),
        ),
      ),
    ),
    PackageName.pro: PackageModel(
      packageName: 'GOLD',
      maxAdsLimit: 2,
      remainingAdsLimit: 2,
      validForDays: 14,
      packageType: 'Pro',
      packagePrice: 1400,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 14),
        ),
      ),
    ),
    PackageName.executive: PackageModel(
      packageName: 'GOLD',
      maxAdsLimit: 4,
      remainingAdsLimit: 4,
      validForDays: 14,
      packageType: 'Executive',
      packagePrice: 2000,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 14),
        ),
      ),
    ),
  };
  static Map<PackageName, PackageModel> platinum = {
    PackageName.novice: PackageModel(
      packageName: 'PLATINUM',
      maxAdsLimit: 1,
      remainingAdsLimit: 1,
      packageType: 'Novice',
      validForDays: 30,
      packagePrice: 2400,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 30),
        ),
      ),
    ),
    PackageName.pro: PackageModel(
      packageName: 'PLATINUM',
      maxAdsLimit: 2,
      remainingAdsLimit: 2,
      validForDays: 30,
      packageType: 'Pro',
      packagePrice: 3000,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 30),
        ),
      ),
    ),
    PackageName.executive: PackageModel(
      packageName: 'PLATINUM',
      maxAdsLimit: 4,
      remainingAdsLimit: 4,
      validForDays: 30,
      packageType: 'Executive',
      packagePrice: 3500,
      packageExpiryDate: Timestamp.fromDate(
        DateTime.now().add(
          Duration(days: 30),
        ),
      ),
    ),
  };
}
