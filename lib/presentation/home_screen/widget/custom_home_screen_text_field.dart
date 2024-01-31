import 'package:flutter/material.dart';

class CustomHomeScreenTextField extends StatelessWidget {
  const CustomHomeScreenTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.textInputType
  });

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
