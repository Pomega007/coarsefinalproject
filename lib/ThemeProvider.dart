import 'package:flutter/material.dart';

class MyThemes {
  static final primaryColorDark = Color(0xFF252525FF);
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColorDark: Color(0xFF252525FF),
    colorScheme: ColorScheme.dark(primary: primaryColorDark),
    dividerColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF252525FF),
    )
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF7F8FDFF),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(primary: primaryColor),
    dividerColor: Colors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    )
  );
}