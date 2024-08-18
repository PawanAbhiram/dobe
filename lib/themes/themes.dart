import 'package:flutter/material.dart';

// Light Theme
ThemeData lightTheme = ThemeData(
  // Define your light theme properties here
  brightness: Brightness.light,
  primaryColor: Colors.white,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.white
  ),

  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: Colors.black
    ) 
  )

  // Add more properties as needed
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  // Define your dark theme properties here
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.white
  ),
  textTheme: TextTheme(
    bodyMedium:TextStyle(
      color: Colors.white
    ) 
  )
  // Add more properties as needed
);
