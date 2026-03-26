import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/rtu_theme.dart';
import 'navigation/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait for consistent UX
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set status bar style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    const ProviderScope(
      child: RTUApp(),
    ),
  );
}

/// Root application widget
class RTUApp extends StatelessWidget {
  const RTUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RTU - Riga Technical University',
      debugShowCheckedModeBanner: false,

      // ── RTU Theme ──
      theme: RTUTheme.lightTheme,

      // ── Navigation ──
      routerConfig: appRouter,

      // ── Localization (EN + LV) ──
      // TODO: Add flutter_localizations delegates in Sprint 1
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
