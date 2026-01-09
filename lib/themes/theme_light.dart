import 'package:flutter/material.dart';
import 'package:notia/components/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Inter',

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.indigo,
    onPrimary: Colors.white,
    secondary: AppColors.indigo.withAlpha(50),
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.lightSurface,
    onSurface: AppColors.textPrimaryLight,
  ),

  scaffoldBackgroundColor: AppColors.lightBackground,

  dividerColor: AppColors.lightDivider,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    foregroundColor: AppColors.textPrimaryLight,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.indigo,
    foregroundColor: Colors.white,
  ),

  cardTheme: CardThemeData(
    color: AppColors.lightSurface,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.lightSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  textTheme: const TextTheme(
    // Hero / onboarding (optional)
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      color: AppColors.textPrimaryLight,
    ),

    // App name / top-level branding
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: AppColors.textPrimaryLight,
    ),

    // Section headers
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),

    // Page titles
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),

    // Note titles
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),

    // Buttons / labels
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight),

    // Main content
    bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: AppColors.textPrimaryLight),

    // Secondary content
    bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: AppColors.textPrimaryLight),

    // Metadata / hints
    bodySmall: TextStyle(fontSize: 12, color: AppColors.textPrimaryLight),
  ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
    )
);
