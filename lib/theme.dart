import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    surface: AppColors.backgroundColor,
    onSurface: AppColors.textColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.textColor),
    bodyMedium: TextStyle(color: AppColors.textColor),
    bodySmall: TextStyle(color: AppColors.textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.backgroundColor, backgroundColor: AppColors.primaryColor, // Color del texto del botón
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      overlayColor: AppColors.hoverColor,
    ),
  ),
);
