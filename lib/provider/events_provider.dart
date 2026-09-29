import 'package:evently/firebase_service.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> displayEvents = [];

  Future<void> getEvents() async {
    allEvents = await FirebaseService.getEvents();
    displayEvents = allEvents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? selectedCategory) {
    if (selectedCategory == null) {
      displayEvents = allEvents;
    } else {
      displayEvents = allEvents
          .where((event) => event.category.id == selectedCategory.id)
          .toList();
    }
    notifyListeners();
  }
}
