import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_constants.dart';
import '../core/theme/theme.dart';

/// Shell screen that wraps the bottom navigation bar around all main screens.
/// The [child] parameter receives the current route's widget from GoRouter.
class ShellScreen extends StatelessWidget {
  final Widget child;

  const ShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _RTUBottomNav(
        currentPath: GoRouterState.of(context).uri.toString(),
      ),
    );
  }
}

class _RTUBottomNav extends StatelessWidget {
  final String currentPath;

  const _RTUBottomNav({required this.currentPath});

  int get _currentIndex {
    if (currentPath.startsWith(RoutePaths.schedule)) return 1;
    if (currentPath.startsWith(RoutePaths.academics)) return 2;
    if (currentPath.startsWith(RoutePaths.services)) return 3;
    if (currentPath.startsWith(RoutePaths.profile)) return 4;
    return 0; // home
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => _onTap(context, index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined),
              selectedIcon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            NavigationDestination(
              icon: Icon(Icons.school_outlined),
              selectedIcon: Icon(Icons.school),
              label: 'Academics',
            ),
            NavigationDestination(
              icon: Icon(Icons.apps_outlined),
              selectedIcon: Icon(Icons.apps),
              label: 'Services',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
      case 1:
        context.go(RoutePaths.schedule);
      case 2:
        context.go(RoutePaths.academics);
      case 3:
        context.go(RoutePaths.services);
      case 4:
        context.go(RoutePaths.profile);
    }
  }
}
