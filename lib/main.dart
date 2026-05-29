// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/shot_tracker/controller/tracker_provider.dart';
import 'features/shot_tracker/view/tracker_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TrackerProvider(),
      child: const BuckshotApp(),
    ),
  );
}

class BuckshotApp extends StatelessWidget {
  const BuckshotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buckshot Roulette Tracker',
      theme: AppTheme.darkTheme,
      home: const TrackerScreen(),
    );
  }
}
