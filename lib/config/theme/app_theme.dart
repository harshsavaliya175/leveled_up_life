import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leveled_up_life/gen/fonts.gen.dart';

import '../../core/constants/app_colors.dart';

class AppTheme {
  static TextStyle latoTextStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      // fontSize: 16,
      fontSize: 12,
      color: lightGreyColor,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    fontFamily: FontFamily.avenirNextRegular,
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
        overlayColor: WidgetStateProperty.all(primaryColor.withOpacity(0.3)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(primaryColor.withOpacity(0.3)),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: primaryColor, primary: primaryColor),
  );
}
