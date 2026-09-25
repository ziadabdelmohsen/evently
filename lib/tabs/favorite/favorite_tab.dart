import 'package:evently/widgets/default_text_form_field.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Search for event',
            suffixIconImageName: 'search',
          ),

          // Expanded(
          //   child: ListView.separated(
          //     itemCount: 10,
          //     itemBuilder: (_, index) => EventItem(),

          //     separatorBuilder: (_, _) => SizedBox(height: 16),
          //   ),
          // ),
        ],
      ),
    );
  }
}
