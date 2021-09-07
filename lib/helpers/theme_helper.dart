import 'package:flutter/material.dart';

class ThemeHelper{

  static ThemeHelper themeHelper = ThemeHelper();
  ThemeData darkThemeData = ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.white)));
  ThemeData lightThemeData = ThemeData.light().copyWith(
      primaryColor: Color(0xffe3aa84),
      scaffoldBackgroundColor: Colors.grey[100],
     // textTheme:
        //  TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.blue))
        );
  ThemeData kidsThemeData = ThemeData.light().copyWith(
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.lightBlue,
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 20, color: Colors.white)));
}