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
      splashFactory: NoSplash.splashFactory,
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

      // Text theme
      textTheme: GoogleFonts.googleSansFlexTextTheme(ThemeData.dark().textTheme)
          .apply(
            displayColor: ac.AppColor.lightTextDefault,
            bodyColor: ac.AppColor.lightTextDefault,
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

      //Input decoration Theme
      inputDecorationTheme: InputDecorationThemeData(
        contentPadding: EdgeInsetsGeometry.only(
          left: 13,
          right: 13,
          top: 8,
          bottom: 8,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ac.AppColor.lightEnabledBorder),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ac.AppColor.lightFocusBorder,
            width: 2.0,
          ),
        ),
        hintStyle: const TextStyle(color: ac.AppColor.lightTextSubtle),
      ),

      // ElevatedButton button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ac.AppColor.primaryBase,
          foregroundColor: ac.AppColor.darkTextDefault,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      // OutlinedButton button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsetsGeometry.only(
            left: 13,
            right: 13,
            top: 10,
            bottom: 10,
          ),
          side: BorderSide(color: ac.AppColor.darkSecondaryBase),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
      textTheme: GoogleFonts.googleSansFlexTextTheme(ThemeData.dark().textTheme)
          .apply(
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

      //Input decoration Theme
      inputDecorationTheme: InputDecorationThemeData(
        contentPadding: EdgeInsetsGeometry.only(
          left: 13,
          right: 13,
          top: 8,
          bottom: 8,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ac.AppColor.darkEnabledBorder),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ac.AppColor.darkFocusBorder,
            width: 2.0,
          ),
        ),
        hintStyle: const TextStyle(color: ac.AppColor.darkTextSubtle),
      ),

      // ElevatedButton button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ac.AppColor.primaryBase,
          foregroundColor: ac.AppColor.darkTextDefault,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),

      // OutlinedButton button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsetsGeometry.only(
            left: 13,
            right: 13,
            top: 10,
            bottom: 10,
          ),
          side: BorderSide(color: ac.AppColor.darkSecondaryBase),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
