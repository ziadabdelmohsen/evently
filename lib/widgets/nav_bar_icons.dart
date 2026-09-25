import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  String iconName;

  NavBarIcon({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: 24,
      height: 24,
      fit: .scaleDown,
    );
  }
}
