import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData.light().copyWith(
    //primaryIconTheme: const IconThemeData(color: Colors.white),
    //iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade400,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade200,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.lightBlue,
      shadowColor: Colors.grey,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.0,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple, //  <-- dark color
      textTheme:
          ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 5,
      shadowColor: Colors.grey,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    )));

final ThemeData darkThemeData = ThemeData.dark().copyWith(
    //primaryIconTheme: const IconThemeData(color: Colors.white),
    //iconTheme: const IconThemeData(color: Colors.white),
    //colorScheme: ColorScheme.dark(
    //  surface: Colors.grey.shade900,
    //  primary: Colors.grey.shade800,
    //  secondary: Colors.grey.shade700,
    // ),
    // textTheme: TextTheme(labelLarge: MyTextStyles.title),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.lightBlue,
      shadowColor: Colors.grey,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.0,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple, //  <-- dark color
      textTheme:
          ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shadowColor: Colors.grey,
      elevation: 5,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    )));
