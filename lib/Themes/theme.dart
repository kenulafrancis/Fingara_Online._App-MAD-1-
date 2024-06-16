import 'package:flutter/material.dart ';
import 'package:online_reservations_for_sports/Themes/elevatedButtonTheme.dart';
import 'package:online_reservations_for_sports/Themes/outlinedButtonTheme.dart';
import 'package:online_reservations_for_sports/Themes/outlinedButtonTheme.dart';


class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      outlinedButtonTheme: ROutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: RElevatedButtonTheme.lightElevatedButtonStyle
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      outlinedButtonTheme: ROutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonStyle
  );

}