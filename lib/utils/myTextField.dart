import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  final String validatorMessage;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.validatorMessage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }
}
