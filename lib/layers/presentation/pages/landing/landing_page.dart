import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/domain/adventure/menus.dart';
import 'package:garment_demo_1/layers/presentation/pages/adventure/adventure_page.dart';
import 'package:garment_demo_1/layers/presentation/widgets/loom_header.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _onBegin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AdventurePage(menus: garmentMenus),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const LoomHeader(),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: theme.textTheme.displayMedium?.copyWith(
                            color: colorScheme.onSecondary,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            const TextSpan(text: 'REIMAGINE THE CLOTHES YOU '),
                            TextSpan(
                              text: "CAN'T",
                              style: TextStyle(color: colorScheme.tertiary),
                            ),
                            const TextSpan(text: ' GET RID OF.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Tap begin to rediscover what your clothes could be',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onBegin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.tertiary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Begin',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
