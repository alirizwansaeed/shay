import 'package:get/get.dart';
import 'package:shay/controllers/authentication.dart';
import 'package:shay/models/models.dart';
import 'package:shay/services/services.dart';

class DatabaseController extends GetxController {
  final _authController = Get.find<AuthenticationController>();

  Rx<List<AdModel>> _allAdsStream = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _featuredAdsStream = Rx<List<AdModel>>([]);
  Rx<List<AdModel>> _fetchedSpecificUserAdsList = Rx<List<AdModel>>([]);

  Rx<List<AdModel>> _searchedads = Rx<List<AdModel>>([]);
  var _fetchedUserData = UserModel().obs;
  var adLikedByMe = false.obs;

  List<AdModel> get allAdsStream {
    return _allAdsStream.value;
  }

  List<AdModel> get searchedAds {
    return _searchedads.value;
  }

  List<AdModel> get featuredAdsStream {
    return _featuredAdsStream.value;
  }

  UserModel get fetchedUserData {
    return _fetchedUserData.value;
  }

  List<AdModel> get fetchedSpecificUserAdsList {
    return _fetchedSpecificUserAdsList.value;
  }

  @override
  void onInit() {
    //BIND ALL ADS STREAM
    _allAdsStream.bindStream(Database.allAdsStream());
    _featuredAdsStream.bindStream(Database.featuredAdsStream());

    super.onInit();
  }

  void fetchSpecificUserAds(String id) async {
    _fetchedSpecificUserAdsList([]);
    List<AdModel> ads = await Database.fetchSpecificUserAds(id);

    _fetchedSpecificUserAdsList(ads);
  }

  Future<UserModel> fetchUser(String uid) async {
    return await Database.fetchUser(uid);
  }









  Future<void> adLikedbyMe(String docid) async {
    adLikedByMe(false);
    var snapshot = await Database.fetchSingleAd(docid: docid);
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
    if (data['Likes'] == null) {
      adLikedByMe(false);
      return;
    }

    Map<String, dynamic> value = data['Likes'];

    value.forEach((key, value) {
      if (key == _authController.currentUser!.uid && value == true) {
        adLikedByMe(true);
        return;
      }
    });
  }

  Future<List<AdModel>> fetchCategory(String value) async {
    return await Database.fetchByCategory(value);
  }

  Future<void> searchads(String value) async {
    _searchedads([]);
    var snapshot = await Database.searchAds(value);

    _searchedads(snapshot);
  }
}
