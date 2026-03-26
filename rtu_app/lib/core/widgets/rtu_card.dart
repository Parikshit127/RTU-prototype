import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Standardized card widget matching RTU's design language.
/// Used across all feature modules for consistent elevation, padding, and rounding.
class RTUCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;

  const RTUCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin ?? const EdgeInsets.symmetric(
        horizontal: RTUSpacing.lg,
        vertical: RTUSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(RTUSpacing.radiusMd),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: elevation ?? 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius as BorderRadius? ??
            BorderRadius.circular(RTUSpacing.radiusMd),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius as BorderRadius? ??
                BorderRadius.circular(RTUSpacing.radiusMd),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(RTUSpacing.lg),
              child: child,
            ),
          ),
        ),
      ),
    );

    return card;
  }
}

/// A card variant with a colored left accent bar — used for schedule items
class RTUAccentCard extends StatelessWidget {
  final Widget child;
  final Color accentColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  const RTUAccentCard({
    super.key,
    required this.child,
    required this.accentColor,
    this.padding,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RTUCard(
      padding: EdgeInsets.zero,
      margin: margin,
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(RTUSpacing.radiusMd),
                  bottomLeft: Radius.circular(RTUSpacing.radiusMd),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: padding ?? const EdgeInsets.all(RTUSpacing.lg),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Status card with an icon and colored background — used for dashboard quick stats
class RTUStatusCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const RTUStatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RTUCard(
      onTap: onTap,
      backgroundColor: color.withValues(alpha: 0.1),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: RTUSpacing.sm),
          Text(
            value,
            style: RTUTypography.headlineMedium.copyWith(color: color),
          ),
          const SizedBox(height: RTUSpacing.xxs),
          Text(
            title,
            style: RTUTypography.bodySmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
