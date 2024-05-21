import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(backgroundColor: Colors.white),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
    splashColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(0.3)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(0.3)),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
  );
}
