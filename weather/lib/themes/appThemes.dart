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
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 50),
        bodyText1: TextStyle(fontSize: 25),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(8),
        shadowColor: Colors.white,
        elevation: 3,
      ),
      backgroundColor: Colors.grey[800],
      primaryColor: Colors.blue[900],
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}
