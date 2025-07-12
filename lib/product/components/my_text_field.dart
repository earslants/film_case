import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final String hintText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white.withOpacity(.5),
      style: TextStyle(color: Colors.white, fontSize: 12),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white.withOpacity(.5),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.5),
          fontSize: 12,
        ),
        fillColor: Colors.white.withOpacity(.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIcon: suffixIcon ?? SizedBox(),
      ),
    );
  }
}
