import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../schedule/domain/entities/class_session.dart';
import '../../../schedule/presentation/providers/schedule_provider.dart';

/// Shows the next 3 upcoming classes for today on the dashboard
class UpcomingClassesList extends ConsumerWidget {
  const UpcomingClassesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingAsync = ref.watch(todayUpcomingProvider);

    return upcomingAsync.when(
      loading: () => const RTUListShimmer(itemCount: 2),
      error: (err, _) => RTUErrorState(
        message: 'Could not load schedule',
        onRetry: () => ref.invalidate(todayUpcomingProvider),
      ),
      data: (classes) {
        if (classes.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.lg),
            child: RTUCard(
              backgroundColor: RTUColors.primarySurface,
              child: Row(
                children: [
                  const Icon(Icons.celebration, color: RTUColors.primary, size: 28),
                  const SizedBox(width: RTUSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No more classes today!',
                          style: RTUTypography.titleSmall.copyWith(
                            color: RTUColors.primary,
                          ),
                        ),
                        Text(
                          'Enjoy your free time or visit the library.',
                          style: RTUTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Show max 3 upcoming classes
        final displayClasses = classes.take(3).toList();

        return Column(
          children: displayClasses
              .map((cls) => _UpcomingClassCard(classSession: cls))
              .toList(),
        );
      },
    );
  }
}

class _UpcomingClassCard extends StatelessWidget {
  final ClassSession classSession;

  const _UpcomingClassCard({required this.classSession});

  @override
  Widget build(BuildContext context) {
    final color = RTUColors.scheduleColors[
      classSession.colorIndex % RTUColors.scheduleColors.length
    ];

    return RTUAccentCard(
      accentColor: color,
      onTap: () {
        // TODO: Navigate to class detail
      },
      child: Row(
        children: [
          // Time column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classSession.startTime,
                style: RTUTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                classSession.endTime,
                style: RTUTypography.bodySmall.copyWith(
                  color: RTUColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(width: RTUSpacing.lg),
          // Course info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classSession.courseName,
                  style: RTUTypography.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: RTUSpacing.xxs),
                Row(
                  children: [
                    _InfoChip(
                      icon: Icons.room_outlined,
                      text: classSession.room,
                    ),
                    const SizedBox(width: RTUSpacing.md),
                    _InfoChip(
                      icon: Icons.person_outlined,
                      text: classSession.professor.split(' ').last,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Type badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: RTUSpacing.sm,
              vertical: RTUSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(RTUSpacing.radiusXs),
            ),
            child: Text(
              classSession.type,
              style: RTUTypography.labelSmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: RTUColors.textSecondary),
        const SizedBox(width: RTUSpacing.xxs),
        Text(
          text,
          style: RTUTypography.labelSmall.copyWith(
            color: RTUColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
