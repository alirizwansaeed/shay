class PostNewAdConstants {
  static Map<String, List<String>> categoryMap = {
    'Mobile': ['Mobile', 'Tablet', 'Accessories'],
    'Laptop': ['Laptop', 'Accessories'],
    'Automobiles Parts': ['Cycle', 'bike', 'Car', 'Parts'],
    'Home Utilities': ['Furniture', 'Kitchen', 'Decoration'],
    'Sports Goods': [
      'Football',
      'Cricket',
      'Hockey',
      'Table Tennis',
      'Snooker'
    ],
    'Cloting': ['Men', 'Women', 'Birde', 'Groom', 'Kids'],
    'Pet & Animals': ["Mics"],
    'Kids': [],
    'Real Estate': ['Plot', 'House', "Agricultural Land", 'Shop', "Plaza"],
    'Services': [],
    'Uncategorized': [],
  };

  static const List<String> typeList = [
    'Sell',
    'Buy',
    'Exchange',
    'Rent',
    'Hire',
    'Lost & Found',
    'Professional Services'
  ];

  static const category = 'Category';
  static const subCategory = "Subcategory";
  static const type = 'Type';
  static const title = 'Title';
  static const description = 'Description';
  static const price = 'Price';
  static const mobileNumber = 'Mobile Number';
  static const itemCondition = 'Item Condition';
  static const city = 'City';
  static const photos = 'Photos';
  static const status = 'Status';
  static const Isfeatured = 'IsFeatured';
  static const date = 'date';
}
