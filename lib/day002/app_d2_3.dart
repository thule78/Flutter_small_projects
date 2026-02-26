import 'package:flutter/material.dart';

class AppD23 extends StatelessWidget {
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppD23({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
        ),
      );
    }
  }