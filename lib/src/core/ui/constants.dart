import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color(0xFF1976D2);
  static const Color dividerColor = Colors.black;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
