import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static ColorScheme get lightScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF2A7812),
        onPrimary: Color(0xFFF5FFF3),
        primaryContainer: Color(0xFFD4FFD8),
        onPrimaryContainer: Color(0xFF117D5A),
        secondary: Color(0xFFDDE7FF),
        onSecondary: Color(0xFF9747FF),
        error: Color(0xFFB3261E),
        onError: Color(0xFFFFFFFF),
        surface: Color(0xFFFBFFFA),
        onSurface: Color(0xFF171916),
        surfaceContainerLow: Color(0xFFF5F5F5),
      );

  static ColorScheme get darkScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF4ACCA2),
        onPrimary: Color(0xFFF5FFF3),
        primaryContainer: Color(0xFFA8FFAE),
        onPrimaryContainer: Color(0xFF126349),
        secondary: Color(0xFFDDE7FF),
        onSecondary: Color(0xFF6A29BD),
        error: Color(0xFFB3261E),
        onError: Color(0xFFFFFFFF),
        surface: Color(0xFF1C201B),
        onSurface: Color(0xFFD0D5CE),
        surfaceContainerLow: Color(0xFF2C2C2C),
      );

  static const Color greyForLines = Color(0xFF8C8A8A);
}
