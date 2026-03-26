import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';

/// Splash screen — shown on app launch.
/// Displays RTU logo and brand while simulating auth check.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // Simulate auth check — navigate after animation
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(RoutePaths.login);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RTUColors.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // RTU Logo placeholder — replace with actual SVG logo
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(RTUSpacing.radiusLg),
                      ),
                      child: Center(
                        child: Text(
                          'RTU',
                          style: RTUTypography.displayLarge.copyWith(
                            color: RTUColors.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.xxl),
                    Text(
                      'Rīgas Tehniskā\nuniversitāte',
                      textAlign: TextAlign.center,
                      style: RTUTypography.headlineLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.sm),
                    Text(
                      'Riga Technical University',
                      style: RTUTypography.bodyMedium.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: RTUSpacing.huge),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
