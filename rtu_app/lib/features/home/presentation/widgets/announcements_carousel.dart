import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

/// University announcements horizontal carousel
class AnnouncementsCarousel extends StatelessWidget {
  const AnnouncementsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final announcements = [
      _Announcement(
        title: 'Spring Semester Exam Registration Open',
        subtitle: 'Register for your exams by April 1st via ORTUS portal.',
        icon: Icons.assignment,
        color: RTUColors.error,
        date: 'Mar 20',
      ),
      _Announcement(
        title: 'Library Extended Hours',
        subtitle: 'Library open until 22:00 during exam preparation period.',
        icon: Icons.access_time,
        color: RTUColors.info,
        date: 'Mar 18',
      ),
      _Announcement(
        title: 'Scholarship Applications Open',
        subtitle: 'Apply for RTU Excellence Scholarship before April 15.',
        icon: Icons.workspace_premium,
        color: RTUColors.warning,
        date: 'Mar 15',
      ),
      _Announcement(
        title: 'New Course Materials Available',
        subtitle: 'Software Engineering lecture slides for Week 8 uploaded.',
        icon: Icons.description,
        color: RTUColors.success,
        date: 'Mar 19',
      ),
    ];

    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.lg),
        itemCount: announcements.length,
        separatorBuilder: (_, __) => const SizedBox(width: RTUSpacing.md),
        itemBuilder: (context, index) {
          final item = announcements[index];
          return _AnnouncementCard(announcement: item);
        },
      ),
    );
  }
}

class _Announcement {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String date;

  _Announcement({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.date,
  });
}

class _AnnouncementCard extends StatelessWidget {
  final _Announcement announcement;

  const _AnnouncementCard({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(RTUSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: announcement.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(RTUSpacing.radiusXs),
                ),
                child: Icon(
                  announcement.icon,
                  size: 18,
                  color: announcement.color,
                ),
              ),
              const Spacer(),
              Text(
                announcement.date,
                style: RTUTypography.labelSmall.copyWith(
                  color: RTUColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: RTUSpacing.md),
          Text(
            announcement.title,
            style: RTUTypography.titleSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: RTUSpacing.xxs),
          Expanded(
            child: Text(
              announcement.subtitle,
              style: RTUTypography.bodySmall.copyWith(
                color: RTUColors.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
