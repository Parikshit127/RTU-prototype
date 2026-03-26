import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'rtu_button.dart';

/// Empty state placeholder when no data is available
/// Provides consistent UX across all screens
class RTUEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const RTUEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(RTUSpacing.xxxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: RTUColors.primarySurface,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: RTUColors.primary),
            ),
            const SizedBox(height: RTUSpacing.xxl),
            Text(
              title,
              style: RTUTypography.headlineMedium,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: RTUSpacing.sm),
              Text(
                subtitle!,
                style: RTUTypography.bodyMedium.copyWith(
                  color: RTUColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null) ...[
              const SizedBox(height: RTUSpacing.xxl),
              RTUPrimaryButton(
                label: actionLabel!,
                onPressed: onAction,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Error state with retry action
class RTUErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const RTUErrorState({
    super.key,
    this.message = 'Something went wrong. Please try again.',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return RTUEmptyState(
      icon: Icons.error_outline,
      title: 'Oops!',
      subtitle: message,
      actionLabel: onRetry != null ? 'Try Again' : null,
      onAction: onRetry,
    );
  }
}
