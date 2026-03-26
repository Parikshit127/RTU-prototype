import 'package:equatable/equatable.dart';

/// Represents a single class session in the student's timetable
class ClassSession extends Equatable {
  final String id;
  final String courseName;
  final String courseCode;
  final String type; // Lecture, Lab, Seminar
  final String professor;
  final String room;
  final String building;
  final int dayOfWeek; // 1=Monday, 5=Friday
  final String startTime;
  final String endTime;
  final int colorIndex;

  const ClassSession({
    required this.id,
    required this.courseName,
    required this.courseCode,
    required this.type,
    required this.professor,
    required this.room,
    required this.building,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.colorIndex,
  });

  /// Format: "08:30 - 10:05"
  String get timeRange => '$startTime - $endTime';

  /// Format: "ĶII-420, Ķīpsala II"
  String get fullLocation => '$room, $building';

  /// Day name from dayOfWeek number
  String get dayName {
    const days = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[dayOfWeek];
  }

  @override
  List<Object?> get props => [id];
}
