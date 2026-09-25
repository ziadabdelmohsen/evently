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
      id: '1',
      name: 'Birthday',
      icon: Icons.cake,
      imageName: 'birthday.png',
    ),
    CategoryModel(
      id: '2',
      name: 'Sports',
      icon: Icons.sports_soccer,
      imageName: 'sports.png',
    ),
  ];
}
