import 'package:flutter/material.dart';

class MyTheme {
  static const Color armadilloColor = Color(0xff49473b);
  static const Color grayNurseColor = Color(0xffDCE0DA);
  static const Color laserColor = Color(0xffCCB267);
  static const Color budColor = Color(0xffA3AE9D);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0x4d91908c),
    primaryColor: budColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: armadilloColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: armadilloColor,
      unselectedItemColor: grayNurseColor,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 20, color: Colors.black),
      headline6: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xcc91908c),
    primaryColor: armadilloColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: armadilloColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: laserColor,
      unselectedItemColor: budColor,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 20, color: grayNurseColor),
      headline6: TextStyle(fontSize: 16, color: grayNurseColor),
    ),
  );
}
