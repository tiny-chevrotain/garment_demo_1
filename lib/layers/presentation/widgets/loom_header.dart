import 'package:flutter/material.dart';

class LoomHeader extends StatelessWidget {
  const LoomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(child: Image.asset('assets/loom.webp', height: 50)),
    );
  }
}
