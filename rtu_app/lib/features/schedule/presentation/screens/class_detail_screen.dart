import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

/// Full-page class detail screen (navigated from deep link or push)
class ClassDetailScreen extends StatelessWidget {
  final String classId;

  const ClassDetailScreen({super.key, required this.classId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Class Details')),
      body: Center(
        child: Text('Class Detail: $classId', style: RTUTypography.bodyLarge),
      ),
    );
  }
}
