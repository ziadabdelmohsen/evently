import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TabItem({
    required this.label,
    required this.icon,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : AppTheme.white,
        border: Border.all(color: AppTheme.offWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? AppTheme.white : primaryColor),
          SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
