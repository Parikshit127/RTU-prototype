import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// Login screen — ORTUS-style authentication
/// Prototype: accepts any credentials and navigates to home
/// Production: will integrate with RTU ORTUS SSO/OAuth
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'janis.berzins@edu.rtu.lv');
  final _passwordController = TextEditingController(text: '••••••••');
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      setState(() => _isLoading = false);
      context.go(RoutePaths.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RTUColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(RTUSpacing.xxl),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: RTUSpacing.huge),

                // ── RTU Logo ──
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: RTUColors.primary,
                      borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
                    ),
                    child: Center(
                      child: Text(
                        'RTU',
                        style: RTUTypography.headlineLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: RTUSpacing.xxl),

                // ── Welcome Text ──
                Text(
                  'Welcome Back',
                  style: RTUTypography.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: RTUSpacing.sm),
                Text(
                  'Sign in with your ORTUS account',
                  style: RTUTypography.bodyMedium.copyWith(
                    color: RTUColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: RTUSpacing.xxxl),

                // ── Email Field ──
                Text(
                  'University Email',
                  style: RTUTypography.labelLarge,
                ),
                const SizedBox(height: RTUSpacing.sm),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'name.surname@edu.rtu.lv',
                    prefixIcon: Icon(Icons.email_outlined, color: RTUColors.textSecondary),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: RTUSpacing.xl),

                // ── Password Field ──
                Text(
                  'Password',
                  style: RTUTypography.labelLarge,
                ),
                const SizedBox(height: RTUSpacing.sm),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outlined, color: RTUColors.textSecondary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: RTUColors.textSecondary,
                      ),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: RTUSpacing.md),

                // ── Forgot Password ──
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: RTUTypography.labelMedium.copyWith(
                        color: RTUColors.primary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: RTUSpacing.xxl),

                // ── Login Button ──
                RTUPrimaryButton(
                  label: 'Sign In',
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                  icon: Icons.login,
                ),

                const SizedBox(height: RTUSpacing.lg),

                // ── Biometric Login ──
                RTUOutlinedButton(
                  label: 'Sign in with Biometrics',
                  icon: Icons.fingerprint,
                  onPressed: _handleLogin,
                ),

                const SizedBox(height: RTUSpacing.xxxl),

                // ── Help Link ──
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Having trouble? Visit ',
                      style: RTUTypography.bodySmall,
                      children: [
                        TextSpan(
                          text: 'ORTUS Support',
                          style: RTUTypography.bodySmall.copyWith(
                            color: RTUColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
