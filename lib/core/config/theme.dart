import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFFF8FAFC),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
    hintStyle: TextStyle(color: Colors.grey[500]),
    errorStyle: TextStyle(color: Colors.redAccent),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);
