import 'package:flutter/material.dart';


class customTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  String? labelText;
  TextInputType? textInputType;
  bool obscureText;
  final String? Function(String?)? validator;
  Icon? icon;
  final Function(String)? onChanged;

  customTextField({
    super.key,
    required this.hintText,
    this.labelText,
    required this.controller,
    this.textInputType,
    this.obscureText = false,
    this.icon,
    this.validator,
    this.onChanged,
  }) ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
      validator: validator,
      onChanged: (value) {
        onChanged;
      },
    );
  }
}
