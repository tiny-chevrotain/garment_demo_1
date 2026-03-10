import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.oswaldTextTheme(),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.secondary,
          secondary: AppColors.backgroundDarker,
          onSecondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
          onTertiary: AppColors.primary,
          surface: AppColors.background,
          onSurface: AppColors.primary,
          error: Colors.red,
          onError: AppColors.secondary,
        ),
        scaffoldBackgroundColor: AppColors.background,
      );
}
