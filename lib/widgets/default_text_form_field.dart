import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? prefixIconImageName;
  final String? suffixIconImageName;
  final void Function(String)? onChanged;
  String? Function(String?)? validator;
  int maxLines;
  bool isPassword;
  DefaultTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.onChanged,
    this.isPassword = false,
    this.validator,
    this.maxLines = 1,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,

        prefixIcon: widget.prefixIconImageName == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIconImageName}.svg',
                  width: 20,
                  height: 20,
                ),
              ),

        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppTheme.grey,
                ),
              )
            : widget.suffixIconImageName == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.suffixIconImageName}.svg',
                  width: 20,
                  height: 20,
                ),
              ),
      ),
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      validator: widget.validator,
      maxLines: widget.maxLines,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
