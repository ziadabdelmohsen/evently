import 'package:evently/models/language_model.dart';
import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/route_logo.png'),
          radius: MediaQuery.sizeOf(context).width * 0.15,
        ),
        SizedBox(height: 16),
        Text('Ziad abdelmohsen', style: textTheme.titleSmall),
        SwitchListTile(
          title: Text('Dark Mode'),
          trackColor: WidgetStatePropertyAll(AppTheme.grey),
          thumbColor: WidgetStatePropertyAll(AppTheme.grey),
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          value: false,
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        ListTile(
          title: Text('language'),
          trailing: DropdownButton(
            value: 'en',
            items: LanguageModel.languages
                .map(
                  (language) => DropdownMenuItem(
                    value: language.code,
                    child: Text(language.name),
                  ),
                )
                .toList(),

            // DropdownMenuItem(child: Text('English'),value: ,),
            //  DropdownMenuItem(child: Text('العربيه'),value: ,)
            onChanged: (value) {},
            underline: SizedBox(),
          ),
        ),
        SizedBox(height: 16),
        ListTile(
          title: Text('Logout'),
          trailing: SvgPicture.asset(
            'assets/icons/logout.svg',
            height: 24,
            width: 24,
            fit: .scaleDown,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
