import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rtu_colors.dart';

/// RTU Typography System
/// ─────────────────────────────────────────────────────────────────
/// RTU's official typeface: FF Mark Pro (commercial license required)
/// Fallback: Google's "Inter" — closest open-source geometric sans-serif
///
/// To switch to FF Mark Pro when license is acquired:
/// 1. Add font files to assets/fonts/
/// 2. Uncomment the fonts section in pubspec.yaml
/// 3. Replace GoogleFonts.inter() calls with TextStyle(fontFamily: 'FFMarkPro')
/// ─────────────────────────────────────────────────────────────────
class RTUTypography {
  RTUTypography._();

  static String get _fontFamily => GoogleFonts.inter().fontFamily!;

  // ── DISPLAY ── (Hero sections, splash screen)
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: RTUColors.onSurface,
        letterSpacing: -0.5,
        height: 1.2,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: RTUColors.onSurface,
        letterSpacing: -0.3,
        height: 1.2,
      );

  // ── HEADLINE ── (Screen titles, section headers)
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: RTUColors.onSurface,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: RTUColors.onSurface,
        height: 1.3,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: RTUColors.onSurface,
        height: 1.3,
      );

  // ── TITLE ── (Card titles, list item titles)
  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: RTUColors.onSurface,
        height: 1.4,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: RTUColors.onSurface,
        height: 1.4,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: RTUColors.onSurface,
        height: 1.4,
      );

  // ── BODY ── (Main content text)
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: RTUColors.onSurface,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: RTUColors.onSurface,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: RTUColors.onSurfaceVariant,
        height: 1.5,
      );

  // ── LABEL ── (Buttons, chips, tags, captions)
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: RTUColors.onSurface,
        letterSpacing: 0.3,
        height: 1.4,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: RTUColors.onSurfaceVariant,
        letterSpacing: 0.3,
        height: 1.4,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: RTUColors.onSurfaceVariant,
        letterSpacing: 0.5,
        height: 1.4,
      );

  /// Build the complete TextTheme for ThemeData
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
