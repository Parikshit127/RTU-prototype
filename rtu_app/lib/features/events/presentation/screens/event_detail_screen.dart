import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventId;
  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Center(
        child: Text('Event: $eventId', style: RTUTypography.bodyLarge),
      ),
    );
  }
}
