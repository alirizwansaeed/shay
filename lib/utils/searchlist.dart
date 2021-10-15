import 'package:shay/models/ad.dart';

class SearchList {
   static List<String> searchlist(AdModel model) {
    List searchFields = [
      ...model.title!.toLowerCase().split(' '),
      ...model.category!.toLowerCase().split(' '),
      ...model.city!.toLowerCase().split(' ')
    ];
    List<String> searchList = [];

    for (var a = 0; a < searchFields.length; a++) {
      for (var i = 1; i <= searchFields[a].length; i++) {
        searchList.add(searchFields[a].substring(0, i));
      }
    }

    return searchList;
  }
}
