import 'package:flutter/material.dart';

class AdventureOption {
  final IconData icon;
  final String name;

  /// The name of the next [AdventureMenu] to navigate to.
  /// An empty string signals a terminal option (end of the adventure).
  final String goTo;

  /// Optional background colour for this option's card.
  /// Falls back to the theme default when null.
  final Color? color;

  const AdventureOption({
    required this.icon,
    required this.name,
    required this.goTo,
    this.color,
  });
}

class AdventureMenu {
  final String name;
  final List<AdventureOption> options;

  const AdventureMenu({
    required this.name,
    required this.options,
  });
}
