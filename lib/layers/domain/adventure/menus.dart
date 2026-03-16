import 'package:flutter/material.dart';
import 'package:garment_demo_1/layers/domain/adventure/adventure_entity.dart';

const garmentMenus = [
  AdventureMenu(
    name: 'What are you trying to create?',
    options: [
      AdventureOption(icon: Icons.checkroom, name: 'Tops', goTo: 'Choose a style'),
      AdventureOption(
          icon: Icons.airline_seat_legroom_normal,
          name: 'Bottoms',
          goTo: 'Choose a style'),
      AdventureOption(
          icon: Icons.dry_cleaning, name: 'Dresses', goTo: 'Choose a style'),
      AdventureOption(
          icon: Icons.wind_power, name: 'Outerwear', goTo: 'Choose a style'),
      AdventureOption(
          icon: Icons.watch, name: 'Accessories', goTo: 'Choose a style'),
      AdventureOption(
          icon: Icons.hiking, name: 'Footwear', goTo: 'Choose a style'),
    ],
  ),
  AdventureMenu(
    name: 'Choose a style',
    options: [
      AdventureOption(
          icon: Icons.wb_sunny_outlined, name: 'Casual', goTo: 'Pick a colour'),
      AdventureOption(
          icon: Icons.business_center_outlined,
          name: 'Formal',
          goTo: 'Pick a colour'),
      AdventureOption(
          icon: Icons.sports_basketball_outlined,
          name: 'Sporty',
          goTo: 'Pick a colour'),
      AdventureOption(
          icon: Icons.auto_awesome, name: 'Vintage', goTo: 'Pick a colour'),
      AdventureOption(
          icon: Icons.minimize, name: 'Minimalist', goTo: 'Pick a colour'),
      AdventureOption(
          icon: Icons.palette_outlined, name: 'Bold', goTo: 'Pick a colour'),
    ],
  ),
  AdventureMenu(
    name: 'Pick a colour',
    options: [
      AdventureOption(
          icon: Icons.circle,
          name: 'Black',
          goTo: '',
          color: Color(0xFF1A1A1A)),
      AdventureOption(
          icon: Icons.circle_outlined,
          name: 'White',
          goTo: '',
          color: Color(0xFFF5F5F5)),
      AdventureOption(
          icon: Icons.water_drop_outlined,
          name: 'Blue',
          goTo: '',
          color: Color(0xFF3B82F6)),
      AdventureOption(
          icon: Icons.local_fire_department_outlined,
          name: 'Red',
          goTo: '',
          color: Color(0xFFEF4444)),
      AdventureOption(
          icon: Icons.eco_outlined,
          name: 'Green',
          goTo: '',
          color: Color(0xFF22C55E)),
      AdventureOption(
          icon: Icons.grain,
          name: 'Neutral',
          goTo: '',
          color: Color(0xFFD4B896)),
    ],
  ),
];
