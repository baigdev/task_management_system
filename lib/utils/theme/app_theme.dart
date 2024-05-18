import 'package:flutter/material.dart';

import '../constant/constant.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();

  ///===== Fonts Notes ========
  ///labelMedium : font size 14,
  ///bodyMedium : font size 14,
  ///bodySmall : font size 10,

  ThemeData kLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
  );
  ThemeData kDarkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusColor: AppColors().primary,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: AppColors().primary),
      ),
      outlineBorder: BorderSide(width: 0.7, color: AppColors().appWhiteColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.7, color: AppColors().appWhiteColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.7, color: AppColors().appWhiteColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 0.7,
          color: AppColors().appWhiteColor.withOpacity(0.2),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 0.7,
          color: AppColors().appWhiteColor.withOpacity(0.2),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: AppColors().error,
        ),
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 14,
        fontStyle: FontStyle.normal,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.proportional,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 12,
        fontStyle: FontStyle.normal,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.proportional,
        color: Colors.white,
        height: 2,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 14,
        fontStyle: FontStyle.normal,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.proportional,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 10,
        fontStyle: FontStyle.normal,
        textBaseline: TextBaseline.alphabetic,
        leadingDistribution: TextLeadingDistribution.proportional,
        color: Colors.white,
      ),
    ),
  );
}
