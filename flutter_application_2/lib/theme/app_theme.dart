import 'package:flutter/material.dart';


class AppTheme {
  static const colorPrimary = Colors.red;
  static const fondo = Color(0xFFF5F5F5);

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: fondo,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
      ),
      elevatedButtonTheme:ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
        )
      )
    );
  }

  

}

 