class PostNewAdModel {
   String? uid;
   String category;
   String type;
   String title;
   String description;
   String price;
   String mobileNumber;
   String itemCondition;
   String city;
   bool? isFeatured;
   String? status;
   Map<String,String>? photos;

  PostNewAdModel({
     this.uid,
    required this.category,
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.mobileNumber,
    required this.itemCondition,
    required this.city,
     this.isFeatured,
     this.status,
     this.photos,
  });

  PostNewAdModel copyWith({
     String? uid,
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
     Map<String, String>? photos,
  }) {
    return PostNewAdModel(
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
    );
  }
}
