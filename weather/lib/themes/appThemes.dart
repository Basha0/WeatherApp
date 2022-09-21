import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              textStyle: TextStyle(color: Colors.white70),
              elevation: 1)),
      backgroundColor: Colors.grey[800],
      primaryColor: Colors.blue[900],
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}
