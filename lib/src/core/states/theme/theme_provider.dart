import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// provider to access and manipulate theme modes
final themeModeProvider = StateProvider<ThemeMode>(
  (_) => ThemeMode.system,
);

/// toggle theme mode
ThemeMode toggleTheme({required ThemeMode themeMode}) {
  switch (themeMode) {
    case ThemeMode.system:
      return ThemeMode.dark;
    case ThemeMode.light:
      return ThemeMode.dark;
    case ThemeMode.dark:
      return ThemeMode.light;
  }
}
