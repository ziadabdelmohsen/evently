import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF0E3A99);
  static const Color primaryDark = Color(0xFF457AED);
  static const Color backgroundLight = Color(0xFFF4F7FF);
  static const Color backgroundDark = Color(0xFF000F30);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF0F0F0);
  static const Color grey = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF686868);
  static const Color black = Color(0xFF1C1C1C);
  static const Color red = Color(0xFFF53323);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primaryLight,
      unselectedItemColor: grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryLight,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: darkGrey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: offWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: offWhite),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16),
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: darkGrey,
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: offWhite),
      ),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: .w500, color: black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLight,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: .bold,
          decoration: .underline,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryLight,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        textStyle: TextStyle(fontSize: 20, fontWeight: .w600),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: black,
      selectedItemColor: primaryDark,
      unselectedItemColor: darkGrey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
  );
}
