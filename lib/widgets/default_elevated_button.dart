import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DefaultElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.sizeOf(context).width, 48),
      ),
      child: Text(label),
    );
  }
}
