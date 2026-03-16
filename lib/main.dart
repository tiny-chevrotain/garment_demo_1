import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:garment_demo_1/core/service_locator.dart';
import 'package:garment_demo_1/core/theme.dart';
import 'package:garment_demo_1/layers/presentation/pages/landing/landing_page.dart';

void main() async {
  setUpServices();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loom',
      theme: AppTheme.theme,
      home: const LandingPage(),
    );
  }
}
