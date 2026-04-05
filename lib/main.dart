import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() =>
    runApp(DevicePreview(enabled: true, builder: (context) => const DevTrackerApp()));

class DevTrackerApp extends StatelessWidget {
  const DevTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}