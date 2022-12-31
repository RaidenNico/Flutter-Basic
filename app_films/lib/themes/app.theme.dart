import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = Colors.indigo;

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    // AppBar Theme
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );
}
