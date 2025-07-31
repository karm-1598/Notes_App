import 'package:college_notes/theme/colors.dart';
import 'package:flutter/material.dart';

var lighttheme=ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: lightAppbarColor,
    toolbarHeight: 80,
    titleSpacing: 1,
    centerTitle: true,
  ),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: lightBgColor,
    onSurface:lightTextColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lightBgColor,
    filled: true,
    iconColor: lightTextColor,
    labelStyle: TextStyle(fontFamily: 'Questrial', fontWeight: FontWeight.w500,color: Colors.black),
    hintStyle: TextStyle(fontFamily: 'Questrial', fontWeight: FontWeight.w500,color: Colors.black),
  ),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Questrial",
          fontSize: 24,
          color: lightTextColor,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: "Questrial",
          fontSize: 20,
          color:lightTextColor ,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 15,
          color: lightTextColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Questrial",
          fontSize: 16,
          color: lightTextColor,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: "Questrial",
          fontSize: 15,
          color: lightTextColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 13,
          color: lightTextColor,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 13,
          color: lightTextColor,
          fontWeight: FontWeight.w300)),
);


var darktheme=ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: darkAppbarColor,
    toolbarHeight: 80,
    
    
    titleSpacing: 1
  ),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    surface: darkBgColor,
    onSurface:lightTextColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkBgColor,
    filled: true,
    iconColor: darkTextColor,
    labelStyle: TextStyle(fontFamily: 'Questrial', fontWeight: FontWeight.w500,color: Colors.white),
    hintStyle: TextStyle(fontFamily: 'Questrial', fontWeight: FontWeight.w500,color: Colors.white),
  ),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Questrial",
          fontSize: 24,
          color: darkTextColor,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: "Questrial",
          fontSize: 20,
          color:darkTextColor ,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 15,
          color: darkTextColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Questrial",
          fontSize: 16,
          color: darkTextColor,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: "Questrial",
          fontSize: 15,
          color: darkTextColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 13,
          color: darkTextColor,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: "Questrial",
          fontSize: 13,
          color: darkTextColor,
          fontWeight: FontWeight.w300)),
);