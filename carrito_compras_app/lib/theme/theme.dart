import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryAzul = Color(0xff00003D);
  static const Color primaryYellow = Color(0xffEFDA30);
  static const Color primaryGrey = Color(0xffB5B5B4);
  static const Color secondaryRed = Color(0xffFF0015);
  static const Color secondaryGrey = Color(0xff757575);
  static const Color background = Color.fromARGB(255, 223, 223, 223);

  static final ThemeData myTheme = ThemeData.light().copyWith(
      primaryColor: primaryAzul,
      primaryColorLight: Colors.white,
      appBarTheme: const AppBarTheme(
        color: primaryAzul,
        elevation: 5,
      ));
}
