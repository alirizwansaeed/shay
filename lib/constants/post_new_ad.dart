import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum categoryNames {
  mobile,
  laptop,
  autoMobile,
  home,
  sports,
  cloting,
  animalPets,
  kids,
  realEstate,
  Services,
  uncategorized
}

class PostNewAdConstants {
  static List<CategoryModel> categorylist = [
    CategoryModel(
      name: 'Mobile',
      subCategory: ['Mobile', 'Tablet', 'Accessories'],
      icon: Icons.phone,
    ),
    CategoryModel(
        name: 'Laptop',
        subCategory: ['Laptop', 'Accessories'],
        icon: Icons.laptop),
    CategoryModel(
        name: 'Automobiles Parts',
        subCategory: ['Cycle', 'bike', 'Car', 'Parts'],
        icon: Icons.ac_unit),
    CategoryModel(
        name: 'Home Utilities',
        subCategory: ['Furniture', 'Kitchen', 'Decoration'],
        icon: Icons.kitchen),
    CategoryModel(
        name: 'Sports Goods',
        subCategory: [
          'Football',
          'Cricket',
          'Hockey',
          'Table Tennis',
          'Snooker'
        ],
        icon: Icons.ac_unit),
    CategoryModel(
        name: 'Cloting',
        subCategory: ['Men', 'Women', 'Birde', 'Groom', 'Kids'],
        icon: Icons.ac_unit),
    CategoryModel(name: 'Pet & Animals', subCategory: [], icon: Icons.ac_unit),
    CategoryModel(name: 'Kids', subCategory: [], icon: Icons.ac_unit),
    CategoryModel(
        name: "'Real Estate'",
        subCategory: ['Plot', 'House', "Agricultural Land", 'Shop', "Plaza"],
        icon: Icons.ac_unit),
    CategoryModel(
        name: 'Uncategorized', subCategory: [], icon: Icons.ac_unit_outlined),
  ];

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
  static const videoUrl = 'Video Url';
}

class CategoryModel {
  String name;
  List<String> subCategory;
  IconData icon;
  CategoryModel({
    required this.name,
    required this.subCategory,
    required this.icon,
  });
}
