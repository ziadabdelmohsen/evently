import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imageName;
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'birthday',
      name: 'Birthday',
      icon: Icons.cake,
      imageName: 'birthday',
    ),
    CategoryModel(
      id: 'sports',
      name: 'Sports',
      icon: Icons.sports_soccer,
      imageName: 'sport',
    ),
  ];
}
