import 'package:flutter/material.dart';

import 'color.dart';

abstract class KTypography {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 34,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.41,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.41,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.36,
      color: Color(kTitleColor),
    ),
    titleLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
      color: Color(kTitleColor),
    ),
    //default style
    titleMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.17,
      color: Color(0xFF444B51),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.17,
      color: Color(0xFF08293B),
    ),
    labelSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}
