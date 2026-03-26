import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Section header with title and optional "See All" action
/// Used on dashboard and list screens to separate content areas
class RTUSectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final EdgeInsetsGeometry? padding;

  const RTUSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: RTUSpacing.lg,
        vertical: RTUSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: RTUTypography.headlineSmall),
          if (actionLabel != null)
            TextButton(
              onPressed: onAction,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionLabel!,
                    style: RTUTypography.labelMedium.copyWith(
                      color: RTUColors.primary,
                    ),
                  ),
                  const SizedBox(width: RTUSpacing.xxs),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: RTUColors.primary,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
