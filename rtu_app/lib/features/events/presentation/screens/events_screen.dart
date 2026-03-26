import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      body: Center(
        child: Text('Events Calendar — Coming in Sprint 3', style: RTUTypography.bodyLarge),
      ),
    );
  }
}
