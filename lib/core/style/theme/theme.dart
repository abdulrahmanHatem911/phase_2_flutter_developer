import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase_2_flutter_developer/core/style/theme/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: AppColor.black),
      titleTextStyle: TextStyle(
        color: AppColor.primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: getTextTheme(),
  );

  static getTextTheme() {
    return TextTheme(
      headline1: GoogleFonts.montserrat(
        color: AppColor.primaryColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
      headline2: GoogleFonts.montserrat(
        color: AppColor.primaryColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.montserrat(
        color: AppColor.rebeccaPurple,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.cairo(
        color: AppColor.gray,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.cairo(
        color: AppColor.primaryColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
