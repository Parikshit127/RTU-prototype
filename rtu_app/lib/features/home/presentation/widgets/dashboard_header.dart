import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';

/// Dashboard greeting header with student name, date, and notification bell
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final greeting = _getGreeting(now.hour);
    final dateStr = DateFormat('EEEE, MMMM d').format(now);

    return Container(
      padding: const EdgeInsets.all(RTUSpacing.xl),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [RTUColors.primary, RTUColors.primaryDark],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(RTUSpacing.radiusLg),
          bottomRight: Radius.circular(RTUSpacing.radiusLg),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
                ),
                child: Center(
                  child: Text(
                    'RTU',
                    style: RTUTypography.labelSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              // Notification bell with badge
              Stack(
                children: [
                  IconButton(
                    onPressed: () => context.push('/profile/notifications'),
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: RTUColors.error,
                        shape: BoxShape.circle,
                        border: Border.all(color: RTUColors.primary, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          '3',
                          style: RTUTypography.labelSmall.copyWith(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: RTUSpacing.xl),

          Text(
            '$greeting, Jānis!',
            style: RTUTypography.headlineLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: RTUSpacing.xs),
          Text(
            dateStr,
            style: RTUTypography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: RTUSpacing.xs),
          Text(
            'Semester 5 • Computer Science',
            style: RTUTypography.bodySmall.copyWith(
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),

          const SizedBox(height: RTUSpacing.lg),
        ],
      ),
    );
  }

  String _getGreeting(int hour) {
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}
