import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'rtu_colors.dart';
import 'rtu_typography.dart';
import 'rtu_spacing.dart';

/// RTU Application Theme
/// ─────────────────────────────────────────────────────────────────
/// Complete Material 3 theme matching RTU's visual identity
/// Supports light theme (dark theme can be added post-contract)
/// ─────────────────────────────────────────────────────────────────
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
        secondaryContainer: RTUColors.primaryTint,
        onSecondaryContainer: RTUColors.primaryDark,
        tertiary: RTUColors.info,
        onTertiary: Colors.white,
        surface: RTUColors.surface,
        onSurface: RTUColors.onSurface,
        onSurfaceVariant: RTUColors.onSurfaceVariant,
        error: RTUColors.error,
        onError: Colors.white,
        outline: RTUColors.divider,
        outlineVariant: RTUColors.divider,
      ),

      // ── Scaffold ──
      scaffoldBackgroundColor: RTUColors.background,

      // ── Typography ──
      textTheme: RTUTypography.textTheme,

      // ── App Bar ──
      appBarTheme: AppBarTheme(
        backgroundColor: RTUColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 2,
        centerTitle: true,
        titleTextStyle: RTUTypography.titleLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // ── Bottom Navigation Bar ──
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: RTUColors.primary,
        unselectedItemColor: RTUColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: RTUTypography.labelSmall.copyWith(
          fontWeight: FontWeight.w600,
          color: RTUColors.primary,
        ),
        unselectedLabelStyle: RTUTypography.labelSmall.copyWith(
          color: RTUColors.textSecondary,
        ),
      ),

      // ── Navigation Bar (Material 3 style) ──
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 3,
        height: 72,
        indicatorColor: RTUColors.primarySurface,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return RTUTypography.labelSmall.copyWith(
              color: RTUColors.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return RTUTypography.labelSmall.copyWith(
            color: RTUColors.textSecondary,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(
              color: RTUColors.primary,
              size: 24,
            );
          }
          return const IconThemeData(
            color: RTUColors.textSecondary,
            size: 24,
          );
        }),
      ),

      // ── Cards ──
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: RTUSpacing.lg,
          vertical: RTUSpacing.sm,
        ),
      ),

      // ── Elevated Button ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: RTUColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: RTUColors.primary.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(
            horizontal: RTUSpacing.xxl,
            vertical: RTUSpacing.md + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          ),
          textStyle: RTUTypography.labelLarge.copyWith(
            color: Colors.white,
          ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // ── Outlined Button ──
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: RTUColors.primary,
          side: const BorderSide(color: RTUColors.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(
            horizontal: RTUSpacing.xxl,
            vertical: RTUSpacing.md + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          ),
          minimumSize: const Size(0, 48),
        ),
      ),

      // ── Text Button ──
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: RTUColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: RTUSpacing.lg,
            vertical: RTUSpacing.sm,
          ),
          textStyle: RTUTypography.labelLarge,
        ),
      ),

      // ── Input Fields ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: RTUColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          borderSide: const BorderSide(color: RTUColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          borderSide: const BorderSide(color: RTUColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          borderSide: const BorderSide(color: RTUColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          borderSide: const BorderSide(color: RTUColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          borderSide: const BorderSide(color: RTUColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: RTUSpacing.lg,
          vertical: RTUSpacing.md + 2,
        ),
        hintStyle: RTUTypography.bodyMedium.copyWith(
          color: RTUColors.disabled,
        ),
        labelStyle: RTUTypography.bodyMedium.copyWith(
          color: RTUColors.textSecondary,
        ),
      ),

      // ── Chips ──
      chipTheme: ChipThemeData(
        backgroundColor: RTUColors.primarySurface,
        selectedColor: RTUColors.primary,
        labelStyle: RTUTypography.labelMedium,
        padding: const EdgeInsets.symmetric(
          horizontal: RTUSpacing.md,
          vertical: RTUSpacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusXl),
        ),
      ),

      // ── Divider ──
      dividerTheme: const DividerThemeData(
        color: RTUColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ── Bottom Sheet ──
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(RTUSpacing.radiusLg),
          ),
        ),
      ),

      // ── Dialog ──
      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        ),
        titleTextStyle: RTUTypography.headlineMedium,
      ),

      // ── TabBar ──
      tabBarTheme: TabBarThemeData(
        labelColor: RTUColors.primary,
        unselectedLabelColor: RTUColors.textSecondary,
        indicatorColor: RTUColors.primary,
        labelStyle: RTUTypography.labelLarge,
        unselectedLabelStyle: RTUTypography.labelMedium,
      ),

      // ── FloatingActionButton ──
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: RTUColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        ),
      ),

      // ── ListTile ──
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: RTUSpacing.lg,
          vertical: RTUSpacing.xs,
        ),
        titleTextStyle: RTUTypography.titleSmall,
        subtitleTextStyle: RTUTypography.bodySmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
        ),
      ),

      // ── SnackBar ──
      snackBarTheme: SnackBarThemeData(
        backgroundColor: RTUColors.onSurface,
        contentTextStyle: RTUTypography.bodyMedium.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
