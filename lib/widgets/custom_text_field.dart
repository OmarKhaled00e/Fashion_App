import 'package:fashion_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the field';
        }
        return null; // مهم جدا علشان ما يظهرش خطأ لو الفيلد مليان
      },

      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyles.hintText15,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
