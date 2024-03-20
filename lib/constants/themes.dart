import 'package:flutter/material.dart';
import 'package:weatherly/constants/colors.dart';

final lightTheme = ThemeData.light(useMaterial3: true);
final darkTheme = ThemeData.dark(useMaterial3: true);

final appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryDark,
    onPrimary: onPrimaryDark,
    secondary: secondaryDark,
    onSecondary: onSecondaryDark,
    surface: Colors.grey.shade800,
    onSurface: Colors.white,
    background: Colors.black,
    onBackground: Colors.white,
    error: errorDark,
    onError: onPrimaryDark
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey.shade400,
    thickness: 0.4
  )
);