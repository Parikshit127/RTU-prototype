import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/theme.dart';
import '../providers/schedule_provider.dart';

/// Horizontal day selector — shows Mon-Fri with the current day highlighted
class DaySelector extends ConsumerWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final now = DateTime.now();

    // Get the Monday of the current week
    final monday = now.subtract(Duration(days: now.weekday - 1));

    return Container(
      color: RTUColors.primary,
      padding: const EdgeInsets.only(
        left: RTUSpacing.md,
        right: RTUSpacing.md,
        bottom: RTUSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final dayNum = index + 1; // 1=Mon, 5=Fri
          final date = monday.add(Duration(days: index));
          final isSelected = dayNum == selectedDay;
          final isToday = dayNum == now.weekday;

          return GestureDetector(
            onTap: () => ref.read(selectedDayProvider.notifier).state = dayNum,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 56,
              padding: const EdgeInsets.symmetric(
                vertical: RTUSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('EEE').format(date).toUpperCase(),
                    style: RTUTypography.labelSmall.copyWith(
                      color: isSelected
                          ? RTUColors.primary
                          : Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: RTUSpacing.xxs),
                  Text(
                    date.day.toString(),
                    style: RTUTypography.titleLarge.copyWith(
                      color: isSelected
                          ? RTUColors.primary
                          : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                  if (isToday) ...[
                    const SizedBox(height: RTUSpacing.xxs),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? RTUColors.primary
                            : Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
