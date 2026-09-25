import 'package:evently/firebase_service.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  static const routeName = '/create-event';
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int tabIndex = 0;
  CategoryModel selectedCategory = CategoryModel.categories.first;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: Text('add Event')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(
                'assets/images/sport.png',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: .fill,
              ),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: DefaultTabController(
              length: CategoryModel.categories.length,
              child: TabBar(
                // padding: EdgeInsets.symmetric(vertical: 24),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: .start,
                labelPadding: EdgeInsetsDirectional.only(end: 8),
                onTap: (index) {
                  if (tabIndex == index) return;
                  tabIndex = index;
                  selectedCategory = CategoryModel.categories[tabIndex];
                  setState(() {});
                },
                tabs: CategoryModel.categories
                    .map(
                      (category) => TabItem(
                        label: category.name,
                        icon: category.icon,
                        isSelected:
                            tabIndex ==
                            CategoryModel.categories.indexOf(category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Title', style: textTheme.titleMedium),
                  SizedBox(height: 8),
                  DefaultTextFormField(
                    hintText: 'Event Title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Text('Description', style: textTheme.titleMedium),
                  SizedBox(height: 12),
                  DefaultTextFormField(
                    maxLines: 5,
                    hintText: 'Event Description',
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/date.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 4),
                      Text('Event Date', style: textTheme.titleMedium),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialDate: selectedDate,
                            initialEntryMode: .calendarOnly,
                          );
                          if (date == null) return;
                          selectedDate = date;
                          setState(() {});
                        },
                        child: Text(
                          selectedDate == null
                              ? 'Choose date'
                              : dateFormat.format(selectedDate!),
                          style: textTheme.titleSmall?.copyWith(
                            color: primaryColor,
                            decoration: .underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/time.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 4),
                      Text('Event Time', style: textTheme.titleMedium),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: selectedTime ?? TimeOfDay.now(),
                          );
                          if (time == null) return;
                          selectedTime = time;
                          setState(() {});
                        },
                        child: Text(
                          selectedTime == null
                              ? 'Choose time'
                              : selectedTime!.format(context),
                          style: textTheme.titleSmall?.copyWith(
                            color: primaryColor,
                            decoration: .underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  DefaultElevatedButton(
                    label: 'Add Event',
                    onPressed: addEvent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      EventModel event = EventModel(
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
      );

      FirebaseService.createEvent(event);
    }
  }
}
