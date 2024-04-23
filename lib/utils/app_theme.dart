// themes.dart

import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xFF34B7F1),
    hintColor: const Color(0xFF075E54),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    //
  );
  static final darkTheme = ThemeData(
    primaryColor: const Color(0xFF075E54),
    hintColor: const Color(0xFF34B7F1),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    //
  );
}
