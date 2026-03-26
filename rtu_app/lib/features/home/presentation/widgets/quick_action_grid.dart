import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';

/// Quick action grid on the dashboard — shortcuts to common tasks
class QuickActionGrid extends StatelessWidget {
  const QuickActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction('Schedule', Icons.calendar_today, RTUColors.scheduleMath, RoutePaths.schedule),
      _QuickAction('Grades', Icons.assessment, RTUColors.success, RoutePaths.academics),
      _QuickAction('Fees', Icons.payment, RTUColors.warning, RoutePaths.services),
      _QuickAction('Library', Icons.local_library, RTUColors.schedulePhysics, RoutePaths.services),
      _QuickAction('Events', Icons.event, RTUColors.scheduleCS, RoutePaths.services),
      _QuickAction('Campus Map', Icons.map, RTUColors.scheduleLab, RoutePaths.services),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.lg),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: RTUSpacing.md,
          crossAxisSpacing: RTUSpacing.md,
          childAspectRatio: 1.0,
        ),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          return _QuickActionTile(action: action);
        },
      ),
    );
  }
}

class _QuickAction {
  final String label;
  final IconData icon;
  final Color color;
  final String route;

  _QuickAction(this.label, this.icon, this.color, this.route);
}

class _QuickActionTile extends StatelessWidget {
  final _QuickAction action;

  const _QuickActionTile({required this.action});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      child: InkWell(
        onTap: () => context.go(action.route),
        borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: action.color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(action.icon, color: action.color, size: 22),
            ),
            const SizedBox(height: RTUSpacing.sm),
            Text(
              action.label,
              style: RTUTypography.labelSmall.copyWith(
                color: RTUColors.onSurface,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
