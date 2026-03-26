import 'package:flutter/material.dart';

/// RTU Brand Color System
/// ─────────────────────────────────────────────────────────────────
/// Extracted from RTU's official visual identity (rtu.lv)
/// Primary: Deep Green — the signature color established through decades
/// Typography: FF Mark Pro (commercial) → Inter (open-source fallback)
/// Design Language: Clean lines, mathematical accuracy, engineering laconism
/// ─────────────────────────────────────────────────────────────────
class RTUColors {
  RTUColors._();

  // ── PRIMARY BRAND COLORS ──
  /// RTU Deep Green — the core brand identity color
  static const Color primary = Color(0xFF005C3A);

  /// Darker shade for active states, pressed buttons, selected items
  static const Color primaryDark = Color(0xFF003D26);

  /// Lighter shade for hover states, containers
  static const Color primaryLight = Color(0xFF007A4D);

  /// Very light green for surfaces, card backgrounds, highlights
  static const Color primarySurface = Color(0xFFE8F5E9);

  /// Subtle green tint for alternating rows, secondary backgrounds
  static const Color primaryTint = Color(0xFFF1F8F3);

  // ── NEUTRAL COLORS ──
  /// Near-black for primary text and headings
  static const Color onSurface = Color(0xFF1A1A2E);

  /// Dark gray for secondary text
  static const Color onSurfaceVariant = Color(0xFF4A4A5A);

  /// Medium gray for tertiary text, timestamps, placeholders
  static const Color textSecondary = Color(0xFF666666);

  /// Light gray for borders, dividers, inactive elements
  static const Color divider = Color(0xFFE0E0E0);

  /// Very light gray for disabled elements
  static const Color disabled = Color(0xFFBDBDBD);

  /// Off-white for scaffold/page backgrounds
  static const Color background = Color(0xFFF5F5F7);

  /// Pure white for card surfaces
  static const Color surface = Color(0xFFFFFFFF);

  // ── SEMANTIC COLORS ──
  /// Success — positive actions, completed states
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);

  /// Warning — caution states, approaching deadlines
  static const Color warning = Color(0xFFF57F17);
  static const Color warningLight = Color(0xFFFFF8E1);

  /// Error — destructive actions, overdue items, failures
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);

  /// Info — informational states, tips, neutral alerts
  static const Color info = Color(0xFF1976D2);
  static const Color infoLight = Color(0xFFE3F2FD);

  // ── SCHEDULE COLOR PALETTE ──
  /// Color-coded classes on the timetable
  static const Color scheduleMath = Color(0xFF1565C0);
  static const Color schedulePhysics = Color(0xFF6A1B9A);
  static const Color scheduleCS = Color(0xFF00838F);
  static const Color scheduleLab = Color(0xFFE65100);
  static const Color scheduleLecture = Color(0xFF2E7D32);
  static const Color scheduleSeminar = Color(0xFF4527A0);
  static const Color scheduleElective = Color(0xFF37474F);

  static const List<Color> scheduleColors = [
    scheduleMath,
    schedulePhysics,
    scheduleCS,
    scheduleLab,
    scheduleLecture,
    scheduleSeminar,
    scheduleElective,
  ];

  // ── GRADE COLORS ──
  static const Color gradeA = Color(0xFF2E7D32);
  static const Color gradeB = Color(0xFF558B2F);
  static const Color gradeC = Color(0xFFF57F17);
  static const Color gradeD = Color(0xFFEF6C00);
  static const Color gradeF = Color(0xFFD32F2F);
}
