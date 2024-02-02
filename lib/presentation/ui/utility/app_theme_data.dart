import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';

class AppThemedata {
  static ThemeData lightThemeData = ThemeData(
    // primarySwatch: MaterialColor(
    //   AppColors.primaryColor.value,
    //   AppColors.colorSwatch,
    // ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 18),
      elevation: 4,
    )
  );
}
