import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/entities/class_session.dart';
import '../../domain/repositories/schedule_repository.dart';

/// Mock implementation of ScheduleRepository
/// Reads from assets/mock_data/schedule.json
/// ─────────────────────────────────────────────────────────────────
/// POST-CONTRACT: Replace this class with OrtusScheduleRepository
/// that calls the real ORTUS API endpoints. The domain layer and
/// presentation layer will not change.
/// ─────────────────────────────────────────────────────────────────
class MockScheduleRepository implements ScheduleRepository {
  List<ClassSession>? _cache;

  Future<List<ClassSession>> _loadClasses() async {
    if (_cache != null) return _cache!;

    final jsonString = await rootBundle.loadString('assets/mock_data/schedule.json');
    final data = json.decode(jsonString);
    final classes = (data['classes'] as List).map((c) => ClassSession(
      id: c['id'],
      courseName: c['courseName'],
      courseCode: c['courseCode'],
      type: c['type'],
      professor: c['professor'],
      room: c['room'],
      building: c['building'],
      dayOfWeek: c['dayOfWeek'],
      startTime: c['startTime'],
      endTime: c['endTime'],
      colorIndex: c['colorIndex'],
    )).toList();

    _cache = classes;
    return classes;
  }

  @override
  Future<List<ClassSession>> getWeeklySchedule() async {
    final classes = await _loadClasses();
    // Sort by day, then by start time
    classes.sort((a, b) {
      final dayCompare = a.dayOfWeek.compareTo(b.dayOfWeek);
      if (dayCompare != 0) return dayCompare;
      return a.startTime.compareTo(b.startTime);
    });
    return classes;
  }

  @override
  Future<List<ClassSession>> getDaySchedule(int dayOfWeek) async {
    final classes = await _loadClasses();
    return classes
        .where((c) => c.dayOfWeek == dayOfWeek)
        .toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
  }

  @override
  Future<ClassSession?> getClassById(String classId) async {
    final classes = await _loadClasses();
    try {
      return classes.firstWhere((c) => c.id == classId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<ClassSession>> getTodayUpcoming() async {
    final now = DateTime.now();
    final todayDow = now.weekday; // 1=Mon, 7=Sun
    final currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    final todayClasses = await getDaySchedule(todayDow);
    return todayClasses.where((c) => c.startTime.compareTo(currentTime) > 0).toList();
  }
}
