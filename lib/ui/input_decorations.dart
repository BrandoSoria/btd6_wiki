import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 255, 253, 253),
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 254, 254, 254),
      ),
    );
  }
}
