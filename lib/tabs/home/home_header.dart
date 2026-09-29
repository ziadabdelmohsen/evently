import 'package:evently/models/category_model.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back', style: textTheme.headlineSmall),
          SizedBox(height: 4),
          Text('Ziad Abdelmohsen', style: textTheme.titleSmall),
          DefaultTabController(
            length: CategoryModel.categories.length + 1,
            child: TabBar(
              //  padding: EdgeInsets.symmetric(vertical: 24),
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: .start,
              labelPadding: EdgeInsetsDirectional.only(end: 8),
              padding: EdgeInsets.symmetric(vertical: 24),
              onTap: (index) {
                if (tabIndex == index) return;
                tabIndex = index;
                CategoryModel? selectedCategory = tabIndex == 0
                    ? null
                    : CategoryModel.categories[tabIndex - 1];
                Provider.of<EventsProvider>(
                  context,
                  listen: false,
                ).filterEvents(selectedCategory);
                setState(() {});
              },
              tabs: [
                TabItem(
                  label: 'All',
                  icon: Icons.all_inclusive,
                  isSelected: tabIndex == 0,
                ),
                ...CategoryModel.categories.map((category) {
                  return TabItem(
                    label: category.name,
                    icon: category.icon,
                    isSelected:
                        tabIndex ==
                        CategoryModel.categories.indexOf(category) + 1,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
