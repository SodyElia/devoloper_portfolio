import 'package:flutter/material.dart';

class AppTheme {
  // =========================
  // BRAND COLORS
  // =========================

  static const Color primaryColor = Color(0xFF0D9488);
  static const Color secondaryColor = Color(0xFF14B8A6);

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);

  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Colors.white;

  // =========================
  // LIGHT THEME
  // =========================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: lightBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: lightSurface,
      foregroundColor: Color(0xFF0F172A),
      elevation: 0,
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
      displayMedium: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
      headlineLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Color(0xFF0F172A),
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        height: 1.6,
        color: Color(0xFF475569),
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Color(0xFF64748B),
      ),
    ),
  );

  // =========================
  // DARK THEME
  // =========================

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: darkBackground,

    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        height: 1.6,
        color: Color(0xFFCBD5E1),
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Color(0xFF94A3B8),
      ),
    ),
  );
}