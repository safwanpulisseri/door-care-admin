import 'package:flutter/material.dart';

class ServiceTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const ServiceTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
