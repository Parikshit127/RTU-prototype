import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rtu_colors.dart';

/// RTU App Theme
/// Uses Google's "Inter" font as closest open-source match to FF Mark Pro
/// (RTU's official typeface). If RTU provides FF Mark Pro license,
/// swap GoogleFonts.inter() with the custom font family.
class RTUTheme {
  RTUTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // ── Color Scheme ──
      colorScheme: const ColorScheme.light(
        primary: RTUColors.primary,
        onPrimary: Colors.white,
        primaryContainer: RTUColors.primarySurface,
        onPrimaryContainer: RTUColors.primaryDark,
        secondary: RTUColors.primaryDark,
        onSecondary: Colors.white,
        surface: RTUColors.surface,
        onSurface: RTUColors.onSurface,
        error: RTUColors.error,
        onError: Colors.white,
      ),

      // ── Typography ──
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: RTUColors.onSurface),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: RTUColors.onSurface),
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: RTUColors.onSurface),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: RTUColors.onSurface),
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: RTUColors.onSurface),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: RTUColors.onSurface),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: RTUColors.onSurface),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: RTUColors.onSurface),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: RTUColors.onSurfaceVariant),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: RTUColors.onSurface),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: RTUColors.onSurfaceVariant),
          labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: RTUColors.onSurfaceVariant),
        ),
      ),

      // ── App Bar ──
      appBarTheme: const AppBarTheme(
        backgroundColor: RTUColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // ── Bottom Navigation ──
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: RTUColors.primary,
        unselectedItemColor: RTUColors.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // ── Cards ──
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // ── Buttons ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: RTUColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: RTUColors.primary,
          side: const BorderSide(color: RTUColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // ── Input Fields ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: RTUColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: RTUColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: RTUColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: RTUColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Chips ──
      chipTheme: ChipThemeData(
        backgroundColor: RTUColors.primarySurface,
        selectedColor: RTUColors.primary,
        labelStyle: const TextStyle(color: RTUColors.onSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // ── Divider ──
      dividerTheme: const DividerThemeData(
        color: RTUColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ── Floating Action Button ──
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: RTUColors.primary,
        foregroundColor: Colors.white,
      ),

      // ── Scaffold ──
      scaffoldBackgroundColor: RTUColors.background,
    );
  }
}
