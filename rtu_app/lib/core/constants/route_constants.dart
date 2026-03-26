/// All route paths defined in one place
/// Prevents typo bugs and makes refactoring easy
class RoutePaths {
  RoutePaths._();

  // ── Auth ──
  static const String splash = '/';
  static const String login = '/login';

  // ── Main Shell (Bottom Nav) ──
  static const String home = '/home';
  static const String schedule = '/schedule';
  static const String academics = '/academics';
  static const String services = '/services';
  static const String profile = '/profile';

  // ── Schedule Sub-routes ──
  static const String classDetail = '/schedule/class/:classId';

  // ── Academics Sub-routes ──
  static const String grades = '/academics/grades';
  static const String courses = '/academics/courses';
  static const String exams = '/academics/exams';
  static const String courseDetail = '/academics/courses/:courseId';
  static const String gradeDetail = '/academics/grades/:semesterId';

  // ── Services Sub-routes ──
  static const String fees = '/services/fees';
  static const String adminServices = '/services/admin';
  static const String library = '/services/library';
  static const String campusMap = '/services/map';
  static const String events = '/services/events';
  static const String eventDetail = '/services/events/:eventId';

  // ── Profile Sub-routes ──
  static const String settings = '/profile/settings';
  static const String notifications = '/profile/notifications';
}

/// Route names for named navigation
class RouteNames {
  RouteNames._();

  static const String splash = 'splash';
  static const String login = 'login';
  static const String home = 'home';
  static const String schedule = 'schedule';
  static const String academics = 'academics';
  static const String services = 'services';
  static const String profile = 'profile';
  static const String classDetail = 'classDetail';
  static const String grades = 'grades';
  static const String courses = 'courses';
  static const String exams = 'exams';
  static const String courseDetail = 'courseDetail';
  static const String fees = 'fees';
  static const String events = 'events';
  static const String eventDetail = 'eventDetail';
  static const String campusMap = 'campusMap';
  static const String notifications = 'notifications';
  static const String settings = 'settings';
}