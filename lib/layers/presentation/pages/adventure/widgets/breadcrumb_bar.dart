import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';

class BreadcrumbBar extends StatelessWidget {
  final List<AdventureOption> selectedOptions;

  const BreadcrumbBar({super.key, required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (selectedOptions.isEmpty) return const SizedBox(height: 28);
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: selectedOptions.length,
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Icons.chevron_right,
            size: 14,
            color: theme.colorScheme.primary,
          ),
        ),
        itemBuilder: (context, index) => Center(
          child: Text(
            selectedOptions[index].name,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary.withValues(alpha: 0.65),
            ),
          ),
        ),
      ),
    );
  }
}
