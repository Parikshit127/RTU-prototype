import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/route_constants.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/schedule/presentation/screens/schedule_screen.dart';
import '../features/schedule/presentation/screens/class_detail_screen.dart';
import '../features/grades/presentation/screens/academics_screen.dart';
import '../features/fees/presentation/screens/services_screen.dart';
import '../features/events/presentation/screens/events_screen.dart';
import '../features/events/presentation/screens/event_detail_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/notifications/presentation/screens/notifications_screen.dart';
import 'shell_screen.dart';

/// Global navigator keys for nested navigation
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter configuration with ShellRoute for bottom navigation persistence
final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutePaths.splash,
  debugLogDiagnostics: true,
  routes: [
    // ── Auth Routes (no bottom nav) ──
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // ── Main App Shell (with bottom nav) ──
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ShellScreen(child: child),
      routes: [
        // Home
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),

        // Schedule
        GoRoute(
          path: RoutePaths.schedule,
          name: RouteNames.schedule,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ScheduleScreen(),
          ),
          routes: [
            GoRoute(
              path: 'class/:classId',
              name: RouteNames.classDetail,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => ClassDetailScreen(
                classId: state.pathParameters['classId']!,
              ),
            ),
          ],
        ),

        // Academics (Grades, Courses, Exams)
        GoRoute(
          path: RoutePaths.academics,
          name: RouteNames.academics,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AcademicsScreen(),
          ),
        ),

        // Services
        GoRoute(
          path: RoutePaths.services,
          name: RouteNames.services,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ServicesScreen(),
          ),
          routes: [
            GoRoute(
              path: 'events',
              name: RouteNames.events,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EventsScreen(),
              routes: [
                GoRoute(
                  path: ':eventId',
                  name: RouteNames.eventDetail,
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => EventDetailScreen(
                    eventId: state.pathParameters['eventId']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Profile
        GoRoute(
          path: RoutePaths.profile,
          name: RouteNames.profile,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
          routes: [
            GoRoute(
              path: 'notifications',
              name: RouteNames.notifications,
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const NotificationsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
