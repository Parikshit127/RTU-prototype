import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Profile screen with student info, settings, and quick links
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RTUColors.background,
      body: CustomScrollView(
        slivers: [
          // ── Profile Header ──
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(RTUSpacing.xxl),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [RTUColors.primary, RTUColors.primaryDark],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: RTUSpacing.lg),
                    // Avatar
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: Text(
                        'JB',
                        style: RTUTypography.headlineLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.lg),
                    Text(
                      'Jānis Bērziņš',
                      style: RTUTypography.headlineMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.xs),
                    Text(
                      '201RDB045 • Computer Science',
                      style: RTUTypography.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      'janis.berzins@edu.rtu.lv',
                      style: RTUTypography.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.lg),
                  ],
                ),
              ),
            ),
          ),

          // ── Settings List ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(RTUSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account', style: RTUTypography.labelLarge.copyWith(color: RTUColors.textSecondary)),
                  const SizedBox(height: RTUSpacing.sm),
                  _SettingsTile(
                    icon: Icons.person_outlined,
                    title: 'Personal Information',
                    subtitle: 'Name, phone, address',
                    onTap: () {},
                  ),
                  _SettingsTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage your notification preferences',
                    onTap: () => context.push('/profile/notifications'),
                  ),
                  _SettingsTile(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'English',
                    onTap: () {},
                  ),

                  const SizedBox(height: RTUSpacing.xxl),
                  Text('Academic', style: RTUTypography.labelLarge.copyWith(color: RTUColors.textSecondary)),
                  const SizedBox(height: RTUSpacing.sm),
                  _SettingsTile(
                    icon: Icons.school_outlined,
                    title: 'Academic Advisor',
                    subtitle: 'Prof. Dr. Māris Kalniņš',
                    onTap: () {},
                  ),
                  _SettingsTile(
                    icon: Icons.description_outlined,
                    title: 'Transcript',
                    subtitle: 'Download official transcript',
                    onTap: () {},
                  ),

                  const SizedBox(height: RTUSpacing.xxl),
                  Text('Support', style: RTUTypography.labelLarge.copyWith(color: RTUColors.textSecondary)),
                  const SizedBox(height: RTUSpacing.sm),
                  _SettingsTile(
                    icon: Icons.help_outline,
                    title: 'ORTUS Support',
                    subtitle: 'Get help with university services',
                    onTap: () {},
                  ),
                  _SettingsTile(
                    icon: Icons.info_outlined,
                    title: 'About RTU App',
                    subtitle: 'Version 1.0.0 (Prototype)',
                    onTap: () {},
                  ),

                  const SizedBox(height: RTUSpacing.xxl),

                  // Logout
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => context.go('/login'),
                      icon: const Icon(Icons.logout, color: RTUColors.error),
                      label: Text(
                        'Sign Out',
                        style: RTUTypography.labelLarge.copyWith(
                          color: RTUColors.error,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: RTUColors.error),
                        padding: const EdgeInsets.symmetric(vertical: RTUSpacing.md),
                      ),
                    ),
                  ),

                  const SizedBox(height: RTUSpacing.xxxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: RTUColors.primarySurface,
            borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
          ),
          child: Icon(icon, color: RTUColors.primary, size: 20),
        ),
        title: Text(title, style: RTUTypography.titleSmall),
        subtitle: Text(subtitle, style: RTUTypography.bodySmall),
        trailing: const Icon(Icons.chevron_right, color: RTUColors.textSecondary),
        onTap: onTap,
      ),
    );
  }
}
