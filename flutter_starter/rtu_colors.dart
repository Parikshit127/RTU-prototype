import 'package:flutter/material.dart';

/// RTU Brand Color System
/// Extracted from RTU's visual identity (designed by Teika agency)
/// Primary brand color: Deep Green - established through decades of RTU identity
class RTUColors {
  RTUColors._();

  // ── Primary Brand Colors ──
  static const Color primary = Color(0xFF005C3A);        // RTU Deep Green
  static const Color primaryDark = Color(0xFF003D26);     // Dark Green (active states)
  static const Color primaryLight = Color(0xFF4CAF50);    // Light Green (accents)
  static const Color primarySurface = Color(0xFFE8F5E9);  // Very Light Green (backgrounds)

  // ── Neutral Colors ──
  static const Color surface = Color(0xFFFFFFFF);          // White
  static const Color background = Color(0xFFF5F5F5);       // Off-white background
  static const Color onSurface = Color(0xFF1A1A2E);        // Near Black (text)
  static const Color onSurfaceVariant = Color(0xFF666666);  // Medium Gray (secondary text)
  static const Color divider = Color(0xFFE0E0E0);          // Light Gray (borders)
  static const Color disabled = Color(0xFFBDBDBD);          // Disabled elements

  // ── Semantic Colors ──
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color warning = Color(0xFFF57F17);
  static const Color warningLight = Color(0xFFFFF8E1);
  static const Color info = Color(0xFF1565C0);
  static const Color infoLight = Color(0xFFE3F2FD);

  // ── Schedule Color Coding ──
  static const List<Color> courseColors = [
    Color(0xFF005C3A), // Green
    Color(0xFF1565C0), // Blue
    Color(0xFF6A1B9A), // Purple
    Color(0xFFE65100), // Orange
    Color(0xFF00838F), // Teal
    Color(0xFFC62828), // Red
    Color(0xFF4E342E), // Brown
    Color(0xFF37474F), // Blue Grey
  ];
}
