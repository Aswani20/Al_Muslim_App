import 'package:flutter/material.dart';

class MyTheme {
  //Colors
  static Color primaryColor = Color(0xffB7935F);
  static Color blackColor = Color(0xff000000);
  static Color whiteColor = Color(0xffffffff);

  //Light Mode Theme Data
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        )),
  );
}
