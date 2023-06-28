import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  useMaterial3: true,
  scaffoldBackgroundColor: lightBgColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffffffff),
    titleTextStyle: TextStyle(
      fontFamily: "Poppins",
      color: lightTextColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: lightTextColor,
    ),
    centerTitle: true,
  ),
  colorScheme: ColorScheme.light(
    background: lightBgColor, // for scaffoldBackgroundColor
    onBackground: lightTextColor, // for text color
    primary: buttonColor, // for appbar background color
    onPrimary: lightTextColor, // for appbar text color
    surface: lightDivColor, // for card background color
    onSurface: lightTextColor, // for card text color
    secondary: buttonColor, // for button background color
    onSecondary: lightColor, // for button text color
    onError: Colors.red, // for error text color
    error: lightDivColor, // for error background color
    primaryContainer: lightDivColor, // for container background color
    secondaryContainer: lightDivColor, // for container background color
    onPrimaryContainer: lightTextColor, // for container text color
    onSecondaryContainer: lightTextColor, // for container text color
  ),
  textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
        color: lightTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: lightColor,
        letterSpacing: 1.2,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: lightTextColor,
      )),
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepOrange,
  useMaterial3: true,
  scaffoldBackgroundColor: darkBgColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff555555),
    titleTextStyle: TextStyle(
      color: darkTextColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: darkTextColor,
    ),
    centerTitle: true,
  ),
  colorScheme: ColorScheme.dark(
    background: darkBgColor, // for scaffoldBackgroundColor
    onBackground: darkTextColor, // for text color
    primary: Colors.deepPurple, // for appbar background color
    onPrimary: Colors.white, // for appbar text color
    surface: darkDivColor, // for card background color
    onSurface: darkTextColor, // for card text color
    secondary: buttonColor, // for button background color
    onSecondary: darkColor, // for button text color
    onError: Colors.red, // for error text color
    error: darkDivColor, // for error background color
    primaryContainer: darkDivColor, // for container background color
    secondaryContainer: darkDivColor, // for container background color
    onPrimaryContainer: darkTextColor, // for container text color
    onSecondaryContainer: darkTextColor, // for container text color
  ),
);
