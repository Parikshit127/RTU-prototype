import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/class_session.dart';

/// Individual class card in the schedule list with timeline connector
class ScheduleClassCard extends StatelessWidget {
  final ClassSession classSession;
  final bool isFirst;
  final bool isLast;

  const ScheduleClassCard({
    super.key,
    required this.classSession,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = RTUColors.scheduleColors[
      classSession.colorIndex % RTUColors.scheduleColors.length
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.md),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Timeline connector ──
            SizedBox(
              width: 60,
              child: Column(
                children: [
                  // Top line
                  if (!isFirst)
                    Container(width: 2, height: 8, color: RTUColors.divider),
                  // Time label
                  Text(
                    classSession.startTime,
                    style: RTUTypography.labelMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: RTUColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: RTUSpacing.xxs),
                  Text(
                    classSession.endTime,
                    style: RTUTypography.labelSmall.copyWith(
                      color: RTUColors.textSecondary,
                    ),
                  ),
                  // Bottom line
                  if (!isLast)
                    Expanded(
                      child: Container(width: 2, color: RTUColors.divider),
                    ),
                ],
              ),
            ),

            // ── Class Card ──
            Expanded(
              child: RTUAccentCard(
                accentColor: color,
                margin: const EdgeInsets.only(bottom: RTUSpacing.sm),
                onTap: () {
                  _showClassDetail(context, classSession, color);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course name + type badge
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            classSession.courseName,
                            style: RTUTypography.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: RTUSpacing.sm),
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
                    const SizedBox(height: RTUSpacing.sm),

                    // Course code
                    Text(
                      classSession.courseCode,
                      style: RTUTypography.bodySmall.copyWith(
                        color: RTUColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.sm),

                    // Info row: professor + room
                    Row(
                      children: [
                        const Icon(Icons.person_outlined, size: 14, color: RTUColors.textSecondary),
                        const SizedBox(width: RTUSpacing.xxs),
                        Expanded(
                          child: Text(
                            classSession.professor,
                            style: RTUTypography.labelSmall.copyWith(
                              color: RTUColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: RTUSpacing.md),
                        const Icon(Icons.room_outlined, size: 14, color: RTUColors.textSecondary),
                        const SizedBox(width: RTUSpacing.xxs),
                        Text(
                          classSession.room,
                          style: RTUTypography.labelSmall.copyWith(
                            color: RTUColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClassDetail(BuildContext context, ClassSession cls, Color color) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(RTUSpacing.radiusLg),
        ),
      ),
      builder: (context) => _ClassDetailSheet(classSession: cls, color: color),
    );
  }
}

class _ClassDetailSheet extends StatelessWidget {
  final ClassSession classSession;
  final Color color;

  const _ClassDetailSheet({
    required this.classSession,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(RTUSpacing.xxl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: RTUColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: RTUSpacing.xxl),

          // Course name
          Row(
            children: [
              Container(
                width: 4,
                height: 28,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: RTUSpacing.md),
              Expanded(
                child: Text(
                  classSession.courseName,
                  style: RTUTypography.headlineMedium,
                ),
              ),
            ],
          ),

          const SizedBox(height: RTUSpacing.xxl),

          _DetailRow(
            icon: Icons.code,
            label: 'Course Code',
            value: classSession.courseCode,
          ),
          _DetailRow(
            icon: Icons.category_outlined,
            label: 'Type',
            value: classSession.type,
          ),
          _DetailRow(
            icon: Icons.person_outlined,
            label: 'Professor',
            value: classSession.professor,
          ),
          _DetailRow(
            icon: Icons.access_time,
            label: 'Time',
            value: classSession.timeRange,
          ),
          _DetailRow(
            icon: Icons.room_outlined,
            label: 'Room',
            value: classSession.room,
          ),
          _DetailRow(
            icon: Icons.location_city_outlined,
            label: 'Building',
            value: classSession.building,
          ),

          const SizedBox(height: RTUSpacing.xxl),

          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Open campus map with building highlighted
                  },
                  icon: const Icon(Icons.map_outlined, size: 18),
                  label: const Text('Find on Map'),
                ),
              ),
              const SizedBox(width: RTUSpacing.md),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Add to device calendar
                  },
                  icon: const Icon(Icons.calendar_today, size: 18),
                  label: const Text('Add to Calendar'),
                ),
              ),
            ],
          ),

          const SizedBox(height: RTUSpacing.lg),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: RTUSpacing.lg),
      child: Row(
        children: [
          Icon(icon, size: 20, color: RTUColors.textSecondary),
          const SizedBox(width: RTUSpacing.md),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: RTUTypography.bodySmall.copyWith(
                color: RTUColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: RTUTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
