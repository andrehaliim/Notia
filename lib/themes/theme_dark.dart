import 'package:flutter/material.dart';
import 'package:notia/components/app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Inter',

  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.indigoDark,
    onPrimary: Colors.white,
    secondary: AppColors.indigoDark.withAlpha(50),
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.darkSurface,
    onSurface: AppColors.textPrimaryDark,
  ),

  scaffoldBackgroundColor: AppColors.darkBackground,

  dividerColor: AppColors.darkDivider,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    foregroundColor: AppColors.textPrimaryDark,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.indigoDark,
    foregroundColor: Colors.white,
  ),

  cardTheme: CardThemeData(
    color: AppColors.darkSurface,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.darkSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  textTheme: const TextTheme(
    // Hero / onboarding (optional)
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      color: AppColors.textPrimaryDark,
    ),

    // App name / top-level branding
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: AppColors.textPrimaryDark,
    ),

    // Section headers
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),

    // Page titles
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),

    // Note titles
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),

    // Buttons / labels
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimaryDark),

    // Main content
    bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: AppColors.textPrimaryDark),

    // Secondary content
    bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: AppColors.textSecondaryDark),

    // Metadata / hints
    bodySmall: TextStyle(fontSize: 12, color: AppColors.textSecondaryDark),
  ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
    )
);
