import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/foundation.dart';

class EventModel {
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    this.id = '',
    required this.category,
    required this.dateTime,
    required this.description,
    required this.title,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'] ?? '',
        category: CategoryModel.categories.firstWhere(
          (cat) => cat.id.toString() == json['categoryId']?.toString(),
          orElse: () => CategoryModel.categories.first,
        ),
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        dateTime: json['timestamp'] != null
            ? (json['timestamp'] as Timestamp).toDate()
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryId': category.id,
    'title': title,
    'description': description,
    'timestamp': Timestamp.fromDate(dateTime),
  };
}
