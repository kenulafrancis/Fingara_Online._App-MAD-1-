import 'package:flutter/material.dart ';
import 'package:online_reservations_for_sports/colors/colors.dart';

class RElevatedButtonTheme {
  RElevatedButtonTheme._();

  static final lightElevatedButtonStyle = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      foregroundColor: WhiteColor,
      backgroundColor: SecondaryColor,
      side: BorderSide(color: SecondaryColor),
      padding: EdgeInsets.symmetric(vertical: 15.0),
    ),
  );


  static final darkElevatedButtonStyle = ElevatedButtonThemeData(
  style:ElevatedButton.styleFrom(
    foregroundColor: SecondaryColor,
    backgroundColor: WhiteColor,
    side: BorderSide(color: SecondaryColor),
    padding: EdgeInsets.symmetric(vertical: 15.0),
  ),
  );

}