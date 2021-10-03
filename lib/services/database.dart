import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shay/constants/constants.dart';
import 'package:shay/constants/post_new_ad.dart';
import 'package:shay/models/models.dart';
import 'package:shay/models/ad.dart';

class Database {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  //user collection
  static CollectionReference get _usersCollection {
    return _db.collection('users');
  }

  static CollectionReference get _postsCollection {
    return _db.collection('posts');
  }

  static Future<void> createNewUser(UserModel userModel) async {
    DocumentReference _userDocument = _usersCollection.doc(userModel.uid);
    //get snapshot of document
    DocumentSnapshot _snapshot = await _userDocument.get();
    // if user record  not exist then add user record
    if (!_snapshot.exists) {
      _userDocument.set(
        {
          Strings.userId: userModel.uid,
          Strings.userDisplayName: userModel.displayName,
          Strings.userBiography: userModel.biography,
          Strings.userMobileNumber: userModel.mobileNumber,
          Strings.userWebsite: userModel.website,
          Strings.userEmail: userModel.email,
          Strings.userAddress: userModel.address,
          Strings.facebook: userModel.facebook,
          Strings.twitter: userModel.twitter,
          Strings.instagram: userModel.instagram,
          Strings.youtube: userModel.youtube,
          Strings.userCreationDate: userModel.creationdate,
          Strings.isVarified: userModel.isVarified,
        },
      );
    }
  }

  static Future<void> updateUser(UserModel userModel) async {
    await _usersCollection.doc(userModel.uid).update(
      {
        if (userModel.displayName != null)
          Strings.userDisplayName: userModel.displayName,
        if (userModel.biography != null)
          Strings.userBiography: userModel.biography,
        if (userModel.mobileNumber != null)
          Strings.userMobileNumber: userModel.mobileNumber,
        if (userModel.website != null) Strings.userWebsite: userModel.website,
        if (userModel.email != null) Strings.userEmail: userModel.email,
        if (userModel.address != null) Strings.userAddress: userModel.address,
        if (userModel.facebook != null) Strings.facebook: userModel.facebook,
        if (userModel.twitter != null) Strings.twitter: userModel.twitter,
        if (userModel.instagram != null) Strings.instagram: userModel.instagram,
        if (userModel.youtube != null) Strings.youtube: userModel.youtube,
        if (userModel.isVarified != null)
          Strings.isVarified: userModel.isVarified,
      },
    );
  }

  static Future<UserModel> fetchUser(String documentid) async {
    return _usersCollection
        .doc(documentid)
        .get()
        .then((value) => UserModel.fromSnapshot(value));
  }

  static Future<void> postNewAdd(AdModel model, List searchArray) async {
    await _postsCollection.doc().set({
      Strings.userId: model.uid,
      PostNewAdConstants.category: model.category,
      PostNewAdConstants.title: model.title,
      PostNewAdConstants.description: model.description,
      PostNewAdConstants.city: model.city,
      PostNewAdConstants.itemCondition: model.itemCondition,
      PostNewAdConstants.mobileNumber: model.mobileNumber,
      PostNewAdConstants.photos: model.photos,
      PostNewAdConstants.price: model.price,
      PostNewAdConstants.type: model.type,
      PostNewAdConstants.Isfeatured: model.isFeatured,
      PostNewAdConstants.status: model.status,
      PostNewAdConstants.date: DateTime.now(),
      PostNewAdConstants.subCategory: model.subCategory,
      PostNewAdConstants.videoUrl: model.videoUrl,
      Strings.likes: {},
      Strings.searchArray: searchArray,
      Strings.adId: DateTime.now().microsecondsSinceEpoch
    });
  }

  static Future<void> updateAd(AdModel model, List searchArray) async {
    await _postsCollection.doc(model.docId).update({
      if (model.category != null) PostNewAdConstants.category: model.category,
      if (model.title != null) PostNewAdConstants.title: model.title,
      if (model.description != null)
        PostNewAdConstants.description: model.description,
      if (model.city != null) PostNewAdConstants.city: model.city,
      if (model.itemCondition != null)
        PostNewAdConstants.itemCondition: model.itemCondition,
      if (model.mobileNumber != null)
        PostNewAdConstants.mobileNumber: model.mobileNumber,
      if (model.photos != null) PostNewAdConstants.photos: model.photos,
      if (model.price != null) PostNewAdConstants.price: model.price,
      if (model.type != null) PostNewAdConstants.type: model.type,
      if (model.isFeatured != null)
        PostNewAdConstants.Isfeatured: model.isFeatured,
      if (model.status != null) PostNewAdConstants.status: model.status,
      if (model.subCategory != null)
        PostNewAdConstants.subCategory: model.subCategory,
      if (model.videoUrl != null) PostNewAdConstants.videoUrl: model.videoUrl,
      if (searchArray.isNotEmpty) Strings.searchArray: searchArray
    });
  }

  //userdata stream
  static Stream<UserModel> currentuserStream(String uid) {
    return _usersCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => UserModel.fromSnapshot(snapshot));
  }

  static Stream<List<AdModel>> allAdsStream() {
    return _postsCollection
        .orderBy(PostNewAdConstants.date, descending: true)
        .snapshots()
        .map((event) {
      List<AdModel> retval = [];
      event.docs.forEach((element) {
        retval.add(AdModel.fromsnapshot(element));
      });
      return retval;
    });
  }

  static Stream<List<AdModel>> featuredAdsStream() {
    return _postsCollection
        .orderBy(PostNewAdConstants.date, descending: true)
        .where(PostNewAdConstants.Isfeatured, isEqualTo: true)
        .snapshots()
        .map((event) {
      List<AdModel> retval = [];
      event.docs.forEach((element) {
        retval.add(AdModel.fromsnapshot(element));
      });
      return retval;
    });
  }

  static Future<List<AdModel>> fetchSpecificUserAds(String id) async {
    List<AdModel> retval = [];
    var val = await _postsCollection
        .where(Strings.userId, isEqualTo: id)
        .orderBy(PostNewAdConstants.date, descending: true)
        .get();
    val.docs.forEach((element) {
      retval.add(AdModel.fromsnapshot(element));
    });

    return retval;
  }

  static Stream<List<AdModel>> currentUserAdsStream(String id) {
    return _postsCollection
        .where(Strings.userId, isEqualTo: id)
        .orderBy(PostNewAdConstants.date, descending: true)
        .snapshots()
        .map((event) {
      List<AdModel> retval = [];
      event.docs.forEach((element) {
        retval.add(AdModel.fromsnapshot(element));
      });
      return retval;
    });
  }

  static Stream<List<AdModel>> likedAdsStream(String uid) {
    return _postsCollection
        .where("Likes.$uid", isEqualTo: true)
        .snapshots()
        .map((event) {
      List<AdModel> retval = [];
      event.docs.forEach((element) {
        retval.add(AdModel.fromsnapshot(element));
      });
      return retval;
    });
  }

  static Future<void> deleteMyad(String docid) async {
    _postsCollection.doc(docid).delete();
  }

  static Future<List<AdModel>> fetchByCategory(String value) async {
    List<AdModel> retval = [];
    var val = await _postsCollection
        .where(PostNewAdConstants.category, isEqualTo: value)
        .orderBy(PostNewAdConstants.date, descending: true)
        .get();
    val.docs.forEach((element) {
      retval.add(AdModel.fromsnapshot(element));
    });
    return retval;
  }

  static Future<List<AdModel>> searchAds(String value) async {
    List<AdModel> retval = [];

    var val = await _postsCollection
        .where(Strings.searchArray, arrayContainsAny: value.split(' '))
        .get();

    val.docs.forEach((element) {
      retval.add(AdModel.fromsnapshot(element));
    });
    return retval;
  }

  static Future<DocumentSnapshot> fetchSingleAd({required String docid}) async {
    return await _postsCollection.doc(docid).get();
  }

  static Future<void> likeAd({
    required String docid,
    required String uid,
    required bool isliked,
  }) async {
    await _postsCollection.doc(docid).update({"Likes.$uid": isliked});
  }
}
