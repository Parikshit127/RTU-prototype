import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../schedule/presentation/providers/schedule_provider.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/quick_action_grid.dart';
import '../widgets/upcoming_classes_list.dart';
import '../widgets/announcements_carousel.dart';

/// Home Dashboard — personalized daily overview for the student.
/// Shows greeting, today's schedule, quick actions, and announcements.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: RTUColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: RTUColors.primary,
          onRefresh: () async {
            // Refresh all data
            ref.invalidate(todayUpcomingProvider);
          },
          child: CustomScrollView(
            slivers: [
              // ── Dashboard Header (Greeting + Notification bell) ──
              const SliverToBoxAdapter(
                child: DashboardHeader(),
              ),

              // ── Quick Stats Cards ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.lg),
                  child: Row(
                    children: [
                      Expanded(
                        child: RTUStatusCard(
                          title: 'GPA',
                          value: '7.8',
                          icon: Icons.trending_up,
                          color: RTUColors.success,
                          onTap: () => context.go(RoutePaths.academics),
                        ),
                      ),
                      const SizedBox(width: RTUSpacing.md),
                      Expanded(
                        child: RTUStatusCard(
                          title: 'Credits',
                          value: '120/240',
                          icon: Icons.school,
                          color: RTUColors.info,
                          onTap: () => context.go(RoutePaths.academics),
                        ),
                      ),
                      const SizedBox(width: RTUSpacing.md),
                      Expanded(
                        child: RTUStatusCard(
                          title: 'Events',
                          value: '3',
                          icon: Icons.event,
                          color: RTUColors.warning,
                          onTap: () => context.go(RoutePaths.services),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: RTUSpacing.xxl)),

              // ── Today's Schedule ──
              SliverToBoxAdapter(
                child: RTUSectionHeader(
                  title: "Today's Classes",
                  actionLabel: 'Full Schedule',
                  onAction: () => context.go(RoutePaths.schedule),
                ),
              ),
              const SliverToBoxAdapter(
                child: UpcomingClassesList(),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: RTUSpacing.xl)),

              // ── Quick Actions Grid ──
              SliverToBoxAdapter(
                child: RTUSectionHeader(
                  title: 'Quick Actions',
                ),
              ),
              const SliverToBoxAdapter(
                child: QuickActionGrid(),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: RTUSpacing.xl)),

              // ── Announcements ──
              SliverToBoxAdapter(
                child: RTUSectionHeader(
                  title: 'Announcements',
                  actionLabel: 'See All',
                  onAction: () {
                    // TODO: Navigate to announcements
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: AnnouncementsCarousel(),
              ),

              // Bottom padding for safe scrolling
              const SliverToBoxAdapter(child: SizedBox(height: RTUSpacing.xxxl)),
            ],
          ),
        ),
      ),
    );
  }
}
