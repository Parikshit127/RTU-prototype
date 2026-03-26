import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Full-width primary action button with loading state
class RTUPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final double? width;

  const RTUPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: RTUSpacing.sm),
                  ],
                  Text(label),
                ],
              ),
      ),
    );
  }
}

/// Outlined secondary action button
class RTUOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? width;

  const RTUOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: RTUSpacing.sm),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}

/// Small chip-style action button for inline use
class RTUChipButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isSelected;

  const RTUChipButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? RTUColors.primary : RTUColors.primarySurface,
      borderRadius: BorderRadius.circular(RTUSpacing.radiusXl),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(RTUSpacing.radiusXl),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: RTUSpacing.lg,
            vertical: RTUSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: isSelected ? Colors.white : RTUColors.primary,
                ),
                const SizedBox(width: RTUSpacing.xs),
              ],
              Text(
                label,
                style: RTUTypography.labelMedium.copyWith(
                  color: isSelected ? Colors.white : RTUColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
