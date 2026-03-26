import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/class_session.dart';
import '../providers/schedule_provider.dart';
import '../widgets/day_selector.dart';
import '../widgets/schedule_class_card.dart';

/// Full schedule screen with day selector and class list
class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final daySchedule = ref.watch(dayScheduleProvider(selectedDay));

    return Scaffold(
      backgroundColor: RTUColors.background,
      appBar: AppBar(
        title: const Text('My Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.view_week_outlined),
            tooltip: 'Week View',
            onPressed: () {
              // TODO: Toggle to week view
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
            onPressed: () {
              // TODO: Filter by course/professor
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Day Selector ──
          const DaySelector(),

          const SizedBox(height: RTUSpacing.sm),

          // ── Schedule Subheader ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getDayLabel(selectedDay),
                  style: RTUTypography.titleMedium.copyWith(
                    color: RTUColors.textSecondary,
                  ),
                ),
                daySchedule.when(
                  data: (classes) => Text(
                    '${classes.length} ${classes.length == 1 ? 'class' : 'classes'}',
                    style: RTUTypography.labelMedium.copyWith(
                      color: RTUColors.textSecondary,
                    ),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),

          const SizedBox(height: RTUSpacing.md),

          // ── Class List ──
          Expanded(
            child: daySchedule.when(
              loading: () => const RTUListShimmer(itemCount: 4),
              error: (err, _) => RTUErrorState(
                message: 'Could not load schedule',
                onRetry: () => ref.invalidate(dayScheduleProvider(selectedDay)),
              ),
              data: (classes) {
                if (classes.isEmpty) {
                  return const RTUEmptyState(
                    icon: Icons.weekend_outlined,
                    title: 'No Classes',
                    subtitle: 'You have no classes scheduled for this day. Enjoy!',
                  );
                }

                return RefreshIndicator(
                  color: RTUColors.primary,
                  onRefresh: () async {
                    ref.invalidate(dayScheduleProvider(selectedDay));
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: RTUSpacing.xs),
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      return ScheduleClassCard(
                        classSession: classes[index],
                        isFirst: index == 0,
                        isLast: index == classes.length - 1,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDayLabel(int dayOfWeek) {
    const days = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final now = DateTime.now();
    if (dayOfWeek == now.weekday) return 'Today';
    if (dayOfWeek == now.weekday + 1) return 'Tomorrow';
    return days[dayOfWeek];
  }
}
