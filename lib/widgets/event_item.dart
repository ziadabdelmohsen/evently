// ignore_for_file: must_be_immutable
import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            'assets/images/${event.category.imageName}.png',
            height: screenSize.height * 0.23,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),

        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.backgroundLight,
            border: Border.all(color: AppTheme.offWhite),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            DateFormat('dd MMM').format(event.dateTime),
            style: textTheme.titleMedium?.copyWith(color: primaryColor),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight,
              border: Border.all(color: AppTheme.offWhite),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: textTheme.titleMedium?.copyWith(color: primaryColor),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.favorite_outline, color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
