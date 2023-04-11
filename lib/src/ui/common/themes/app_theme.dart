import 'package:flutter/material.dart';

final lightAppTheme = ThemeData(
  // Define the default brightness and colors
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 36.0,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Hind',
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueAccent,
    shape: RoundedRectangleBorder(),
    textTheme: ButtonTextTheme.accent,
  ),
);

final darkAppTheme = ThemeData.dark();
