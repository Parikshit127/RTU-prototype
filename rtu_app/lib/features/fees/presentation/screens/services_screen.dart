import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';

/// Services tab — grid of student services
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      _Service('Fees & Payments', Icons.payment, RTUColors.warning, 'Outstanding: €1,250'),
      _Service('Events', Icons.event, RTUColors.scheduleCS, '3 upcoming events'),
      _Service('Library', Icons.local_library, RTUColors.schedulePhysics, 'Open until 20:00'),
      _Service('Campus Map', Icons.map, RTUColors.scheduleLab, 'Find buildings & rooms'),
      _Service('Admin Services', Icons.support_agent, RTUColors.info, 'Document requests'),
      _Service('Dormitory', Icons.apartment, RTUColors.scheduleSeminar, 'Ķīpsala Dormitory'),
      _Service('Career Center', Icons.work_outline, RTUColors.success, '12 new job postings'),
      _Service('IT Support', Icons.computer, RTUColors.scheduleElective, 'ORTUS & Wi-Fi help'),
      _Service('Counseling', Icons.psychology, RTUColors.scheduleMath, 'Book appointment'),
    ];

    return Scaffold(
      backgroundColor: RTUColors.background,
      appBar: AppBar(title: const Text('Services')),
      body: GridView.builder(
        padding: const EdgeInsets.all(RTUSpacing.lg),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: RTUSpacing.md,
          crossAxisSpacing: RTUSpacing.md,
          childAspectRatio: 0.85,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return _ServiceTile(service: services[index]);
        },
      ),
    );
  }
}

class _Service {
  final String label;
  final IconData icon;
  final Color color;
  final String subtitle;

  _Service(this.label, this.icon, this.color, this.subtitle);
}

class _ServiceTile extends StatelessWidget {
  final _Service service;

  const _ServiceTile({required this.service});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to specific service
        },
        borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(RTUSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: service.color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(service.icon, color: service.color, size: 24),
              ),
              const SizedBox(height: RTUSpacing.sm),
              Text(
                service.label,
                style: RTUTypography.labelSmall.copyWith(
                  color: RTUColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
