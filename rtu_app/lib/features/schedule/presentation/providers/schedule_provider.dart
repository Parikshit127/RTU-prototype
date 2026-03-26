import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_schedule_repository.dart';
import '../../domain/entities/class_session.dart';
import '../../domain/repositories/schedule_repository.dart';

/// Repository provider — swap MockScheduleRepository with real implementation here
final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  return MockScheduleRepository();
});

/// Weekly schedule data
final weeklyScheduleProvider = FutureProvider<List<ClassSession>>((ref) {
  final repo = ref.watch(scheduleRepositoryProvider);
  return repo.getWeeklySchedule();
});

/// Schedule for a specific day
final dayScheduleProvider = FutureProvider.family<List<ClassSession>, int>((ref, dayOfWeek) {
  final repo = ref.watch(scheduleRepositoryProvider);
  return repo.getDaySchedule(dayOfWeek);
});

/// Today's upcoming classes (for dashboard)
final todayUpcomingProvider = FutureProvider<List<ClassSession>>((ref) {
  final repo = ref.watch(scheduleRepositoryProvider);
  return repo.getTodayUpcoming();
});

/// Class detail by ID
final classDetailProvider = FutureProvider.family<ClassSession?, String>((ref, classId) {
  final repo = ref.watch(scheduleRepositoryProvider);
  return repo.getClassById(classId);
});

/// Currently selected day in the schedule view (1=Mon, 7=Sun)
final selectedDayProvider = StateProvider<int>((ref) {
  return DateTime.now().weekday;
});
