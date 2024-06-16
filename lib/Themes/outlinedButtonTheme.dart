import 'package:flutter/material.dart ';
import 'package:online_reservations_for_sports/colors/colors.dart';


class ROutlinedButtonTheme {
  ROutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: SecondaryColor,
      side: BorderSide(color: SecondaryColor),
      padding: EdgeInsets.symmetric(vertical: 15.0),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: WhiteColor,
      side: BorderSide(color: WhiteColor),
      padding: EdgeInsets.symmetric(vertical: 15.0),
    ),
  );

}
