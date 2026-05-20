import 'package:flinterest/core/theme/app_color.dart' as ac;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //=========================
  // Light Theme
  //=========================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ac.AppColor.lightBackground,

      //ColorScheme
      colorScheme: const ColorScheme.light(
        primary: ac.AppColor.primaryBase,
        secondary: ac.AppColor.lightSecondaryBase,
        surface: ac.AppColor.lightBackground,
        error: ac.AppColor.statusError,
        onPrimary: Colors.white,
        onSecondary: ac.AppColor.lightTextDefault,
      ),

      // Text Theme
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: ac.AppColor.lightTextDefault,
        displayColor: ac.AppColor.lightTextDefault,
      ),

      // appbar theme
      appBarTheme: AppBarTheme(
        backgroundColor: ac.AppColor.lightBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ac.AppColor.lightTextDefault),
        titleTextStyle: TextStyle(
          color: ac.AppColor.lightTextDefault,
          fontSize: 20,
          fontWeight: .bold,
        ),
      ),

      // text field theme

      // ElevatedButton button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ac.AppColor.primaryBase,
          elevation: 0,
        ),
      ),

      // spacing???
    );
  }

  //=========================
  // Dark Theme
  //=========================
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ac.AppColor.darkBackground,

      // colorScheme
      colorScheme: const ColorScheme.dark(
        primary: ac.AppColor.primaryBase,
        secondary: ac.AppColor.darkSecondaryBase,
        surface: ac.AppColor.darkBackground,
        onPrimary: Colors.white,
        onSecondary: ac.AppColor.darkTextDefault,
      ),

      // Text theme
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
        displayColor: ac.AppColor.darkTextDefault,
        bodyColor: ac.AppColor.darkTextDefault,
      ),

      // appbar theme
      appBarTheme: AppBarTheme(
        backgroundColor: ac.AppColor.darkBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ac.AppColor.darkTextDefault),
        titleTextStyle: TextStyle(
          color: ac.AppColor.darkTextDefault,
          fontSize: 20,
          fontWeight: .bold,
        ),
      ),

      // ElevatedButton button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ac.AppColor.primaryBase,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      // button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsetsGeometry.all(13),
          side: BorderSide(color: ac.AppColor.darkSecondaryBase),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
