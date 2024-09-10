// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GCConstants {
  Size size;
  static Color primaryColor = const Color.fromRGBO(64, 9, 102, 1);
  static Color secondaryTextColor = const Color.fromRGBO(99, 103, 117, 1);
  static Color secondaryColor = const Color.fromRGBO(146, 4, 190, 1);
  static Color borderColor = const Color.fromRGBO(217, 217, 217, 1);
  static Color quatenaryColor = const Color.fromRGBO(244, 231, 248, 1);
  static Color successColor = const Color.fromRGBO(180, 235, 99, 1);
  static Color tertiaryTextColor = const Color.fromRGBO(90, 85, 94, 1);
  static Color errorColor = const Color.fromRGBO(208, 54, 96, 1);
  static Color whiteColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color WarningColor = const Color.fromRGBO(255, 211, 127, 1);
  static Color errorLightColor = const Color.fromRGBO(255, 213, 213, 1);

  GCConstants({
    required this.size,
  });
  double fontsize() => size.height <= 390
      ? 15.dg
      : size.height <= 515
          ? 15.dg
          : 13;
  double secFontSize() => size.width <= 390
      ? 34.dg
      : size.width <= 515
          ? 28.dg
          : 27;

  double textFieldFont() => size.height <= 390
      ? 13.dg
      : size.height <= 515
          ? 13.dg
          : 11;

  double gcButtonPaddingTop() => size.height <= 450
      ? 21.dg
      : size.height <= 645
          ? 17.dg
          : 11;

  double gcButtonPaddingBottom() => size.height <= 450
      ? 21.dg
      : size.height <= 645
          ? 17.dg
          : 11;
}
