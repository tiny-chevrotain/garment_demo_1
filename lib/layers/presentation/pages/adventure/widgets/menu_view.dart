import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';

class MenuView extends StatelessWidget {
  final AdventureMenu menu;
  final void Function(AdventureOption) onSelect;

  const MenuView({super.key, required this.menu, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 0.9,
      children: menu.options
          .map((option) => OptionCard(option: option, onTap: () => onSelect(option)))
          .toList(),
    );
  }
}

class OptionCard extends StatelessWidget {
  final AdventureOption option;
  final VoidCallback onTap;

  const OptionCard({super.key, required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final baseColor = option.color ?? colorScheme.onPrimary;
    final optionColor = baseColor.computeLuminance() > 0.4
        ? colorScheme.primary
        : colorScheme.onPrimary;
    return Material(
      color: baseColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        splashColor: colorScheme.secondary.withValues(alpha: 0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(option.icon, size: 80, color: optionColor),
              const SizedBox(height: 14),
              Text(
                option.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: optionColor,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
