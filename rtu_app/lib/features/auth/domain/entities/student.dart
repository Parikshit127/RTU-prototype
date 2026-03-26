import 'package:equatable/equatable.dart';

/// Student entity — core domain model representing the logged-in user.
/// This entity is used across multiple features (profile, dashboard, grades).
class Student extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String studentId;
  final String faculty;
  final String program;
  final int semester;
  final int yearOfStudy;
  final int enrollmentYear;
  final double gpa;
  final int totalCredits;
  final int requiredCredits;
  final String? profileImageUrl;
  final String? phone;
  final String language;
  final String? dormitory;
  final String? advisorName;
  final String? advisorEmail;

  const Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.studentId,
    required this.faculty,
    required this.program,
    required this.semester,
    required this.yearOfStudy,
    required this.enrollmentYear,
    required this.gpa,
    required this.totalCredits,
    required this.requiredCredits,
    this.profileImageUrl,
    this.phone,
    required this.language,
    this.dormitory,
    this.advisorName,
    this.advisorEmail,
  });

  String get fullName => '$firstName $lastName';
  double get creditProgress => totalCredits / requiredCredits;

  @override
  List<Object?> get props => [id, studentId];
}
