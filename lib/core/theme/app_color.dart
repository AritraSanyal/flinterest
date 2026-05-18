import 'package:flinterest/core/theme/app_palette.dart' as ap;
import 'package:flutter/material.dart';

class AppColor {
  //==================
  // Primary and shared colors
  //==================
  static const Color primaryBase = ap.AppPalette.pushpin450;
  static const Color statusSuccess = ap.AppPalette.green500;
  static const Color statusError = ap.AppPalette.red500;

  //==================
  // Light Theme
  //==================
  static const Color lightSecondaryBase = ap.AppPalette.roboflow200;
  static const Color lightBackground = ap.AppPalette.marshmallow0;

  static const Color lightTextDefault = ap.AppPalette.cosmicore900;
  static const Color lightTextSubtle = ap.AppPalette.roboflow500;

  //==================
  // Dark Theme
  //==================
  static const Color darkSecondaryBase = ap.AppPalette.roboflow500;
  static const Color darkBackground = ap.AppPalette.cosmicore900;

  static const Color darkTextDefault = ap.AppPalette.marshmallow0;
  static const Color darkTextSubtle = ap.AppPalette.roboflow400;
}
