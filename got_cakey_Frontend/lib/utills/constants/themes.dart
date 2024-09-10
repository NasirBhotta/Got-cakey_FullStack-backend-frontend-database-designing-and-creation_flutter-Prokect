import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';

class GCThemes {
  GCThemes._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily:
        'Ginto Nordo PP-Mori-Regular PP-Mori-Extralight PP-Mori-Semibold ',
    primaryColor: GCConstants.primaryColor,
    scaffoldBackgroundColor: GCConstants.whiteColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom().copyWith(
            textStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontFamily: 'PP-Mori-Regular',
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(GCConstants.primaryColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))))),
    textTheme: TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'Ginto',
            fontWeight: FontWeight.bold,
            color: GCConstants.primaryColor),
        displayMedium: const TextStyle().copyWith(
            fontFamily: 'Ginto',
            fontWeight: FontWeight.w700,
            color: GCConstants.primaryColor),
        displaySmall: TextStyle(
            fontFamily: 'PP-Mori-Semibold',
            fontWeight: FontWeight.w600,
            color: GCConstants.primaryColor),
        headlineSmall: const TextStyle().copyWith(
            fontFamily: 'PP-Mori-Regular',
            fontWeight: FontWeight.w400,
            color: GCConstants.tertiaryTextColor)),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(208, 54, 96, 1),
          ),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(208, 54, 96, 1),
          ),
          borderRadius: BorderRadius.circular(10)),
      labelStyle: TextStyle(
        color: GCConstants.tertiaryTextColor,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: GCConstants.borderColor)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: GCConstants.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
