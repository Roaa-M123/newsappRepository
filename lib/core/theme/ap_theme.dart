import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/colors.dart';

class AppTheme {
  static final ThemeData _lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: AppColors.lightPinkColor ,
    ),
    primaryColorDark: AppColors.darkBlueColor,
    primaryColor: AppColors.whiteColor,
    // ignore: deprecated_member_use
    shadowColor: AppColors.blackColor.withOpacity(0.19),
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.navyBlueColor,
        fontWeight:FontWeight.bold,
        fontSize: 20,
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.whiteColor),
      headlineMedium: TextStyle(color: Colors.grey),
    ),
  );
  static final ThemeData _darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackColor,
      unselectedItemColor:Colors.grey,
      selectedItemColor: AppColors.lightColor ,
    ),
    primaryColorDark: AppColors.blueColor,
    primaryColor: AppColors.blackColor,
    // ignore: deprecated_member_use
    shadowColor: AppColors.whiteColor.withOpacity(0.19),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      centerTitle:true,
      elevation: 0,
      titleTextStyle:  TextStyle(
        color: AppColors.whiteColor,
        fontWeight:FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.whiteColor),
      headlineMedium: TextStyle(color: Colors.grey),
    ),
  );

  static ThemeData getLightTheme() {
    return _lightTheme;
  }

  static ThemeData getDarkTheme() {
    return _darkTheme;
  }
}
