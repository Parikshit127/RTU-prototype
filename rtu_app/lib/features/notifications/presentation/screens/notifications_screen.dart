import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

/// Notifications center with categorized notification feed
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      _NotifItem('Exam Registration Open', 'Register for spring exams by April 1st.', Icons.assignment, RTUColors.error, '2h ago', false),
      _NotifItem('Grade Posted', 'Web Technologies: 9 (Excellent)', Icons.grade, RTUColors.success, '5h ago', false),
      _NotifItem('New Course Material', 'Software Engineering — Week 8 slides uploaded', Icons.description, RTUColors.info, '1d ago', true),
      _NotifItem('Fee Reminder', 'Tuition payment of €1,250 due by April 5th', Icons.payment, RTUColors.warning, '1d ago', true),
      _NotifItem('Event Reminder', 'Guest Lecture: AI in Engineering — Tomorrow 14:00', Icons.event, RTUColors.scheduleCS, '2d ago', true),
      _NotifItem('Library Due', 'Return "Algorithms" by March 25th', Icons.local_library, RTUColors.schedulePhysics, '3d ago', true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark All Read',
              style: RTUTypography.labelMedium.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(RTUSpacing.lg),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: RTUSpacing.sm),
        itemBuilder: (context, index) {
          final n = notifications[index];
          return Container(
            padding: const EdgeInsets.all(RTUSpacing.lg),
            decoration: BoxDecoration(
              color: n.isRead ? Colors.white : RTUColors.primaryTint,
              borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
              border: n.isRead ? null : Border.all(color: RTUColors.primarySurface),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: n.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
                  ),
                  child: Icon(n.icon, color: n.color, size: 20),
                ),
                const SizedBox(width: RTUSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              n.title,
                              style: RTUTypography.titleSmall.copyWith(
                                fontWeight: n.isRead ? FontWeight.w500 : FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(n.time, style: RTUTypography.labelSmall),
                        ],
                      ),
                      const SizedBox(height: RTUSpacing.xxs),
                      Text(
                        n.subtitle,
                        style: RTUTypography.bodySmall.copyWith(
                          color: RTUColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!n.isRead)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 6, left: 8),
                    decoration: const BoxDecoration(
                      color: RTUColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NotifItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String time;
  final bool isRead;

  _NotifItem(this.title, this.subtitle, this.icon, this.color, this.time, this.isRead);
}
