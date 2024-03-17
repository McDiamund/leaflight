import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        fillColor: Color.fromARGB(255, 246, 246, 246),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}
