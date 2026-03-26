import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Academics tab — contains Grades, Courses, and Exams sub-tabs
class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: RTUColors.background,
        appBar: AppBar(
          title: const Text('Academics'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Grades'),
              Tab(text: 'Courses'),
              Tab(text: 'Exams'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _GradesTab(),
            _CoursesTab(),
            _ExamsTab(),
          ],
        ),
      ),
    );
  }
}

class _GradesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(RTUSpacing.lg),
      children: [
        // GPA Overview Card
        RTUCard(
          backgroundColor: RTUColors.primarySurface,
          child: Column(
            children: [
              Text('Overall GPA', style: RTUTypography.labelMedium),
              const SizedBox(height: RTUSpacing.sm),
              Text(
                '7.8',
                style: RTUTypography.displayLarge.copyWith(
                  color: RTUColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: RTUSpacing.xs),
              Text(
                '120 / 240 credits earned',
                style: RTUTypography.bodySmall.copyWith(
                  color: RTUColors.textSecondary,
                ),
              ),
              const SizedBox(height: RTUSpacing.lg),
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 120 / 240,
                  backgroundColor: RTUColors.divider,
                  valueColor: const AlwaysStoppedAnimation(RTUColors.primary),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: RTUSpacing.xl),

        // Semester list
        RTUSectionHeader(title: 'Semester 5 — Fall 2025', padding: EdgeInsets.zero),
        const SizedBox(height: RTUSpacing.sm),
        ..._buildSemesterGrades(),
      ],
    );
  }

  List<Widget> _buildSemesterGrades() {
    final grades = [
      ('Data Structures and Algorithms', 'DatZ3001', 8, 6),
      ('Operating Systems', 'DatZ4020', 7, 4),
      ('Web Technologies', 'DatZ3045', 9, 6),
      ('Discrete Mathematics', 'MatZ2001', 7, 4),
      ('Software Engineering', 'DatZ4015', 8, 6),
      ('Latvian Language B2', 'ValZ1002', 8, 2),
    ];

    return grades.map((g) {
      final color = g.$3 >= 9
          ? RTUColors.gradeA
          : g.$3 >= 8
              ? RTUColors.gradeB
              : g.$3 >= 7
                  ? RTUColors.gradeC
                  : RTUColors.gradeD;

      return RTUCard(
        margin: const EdgeInsets.only(bottom: RTUSpacing.sm),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(RTUSpacing.radiusSm),
              ),
              child: Center(
                child: Text(
                  g.$3.toString(),
                  style: RTUTypography.titleLarge.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: RTUSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(g.$1, style: RTUTypography.titleSmall),
                  Text(
                    '${g.$2} • ${g.$4} credits',
                    style: RTUTypography.bodySmall.copyWith(
                      color: RTUColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

class _CoursesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const RTUEmptyState(
      icon: Icons.book_outlined,
      title: 'Enrolled Courses',
      subtitle: 'Your current semester courses will appear here.',
    );
  }
}

class _ExamsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const RTUEmptyState(
      icon: Icons.assignment_outlined,
      title: 'Upcoming Exams',
      subtitle: 'Exam schedule will be available after registration.',
    );
  }
}
