import '../entities/class_session.dart';

/// Abstract repository interface for schedule data.
/// ─────────────────────────────────────────────────────────────────
/// PROTOTYPE: MockScheduleRepository reads from local JSON
/// PRODUCTION: Will be replaced with OrtusScheduleRepository
///             that calls the real ORTUS API
/// ─────────────────────────────────────────────────────────────────
abstract class ScheduleRepository {
  /// Get all classes for the current week
  Future<List<ClassSession>> getWeeklySchedule();

  /// Get classes for a specific day (1=Mon, 7=Sun)
  Future<List<ClassSession>> getDaySchedule(int dayOfWeek);

  /// Get details for a specific class session
  Future<ClassSession?> getClassById(String classId);

  /// Get today's remaining classes
  Future<List<ClassSession>> getTodayUpcoming();
}
