import 'package:flutter/material.dart';

import 'constants.dart';

enum AppTheme { light, dark }

class ThemeNotifier extends ChangeNotifier {
  late ThemeData _themeData;
  late Color _backgroundColor;

  ThemeNotifier() {
    _themeData = _buildLightTheme();
    _backgroundColor = backgroundlight;
  }

  ThemeData getTheme() => _themeData;

  Color getBackgroundColor() => _backgroundColor;

  bool get isDarkTheme => _themeData.brightness == Brightness.dark;

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        _themeData = _buildLightTheme();
        _backgroundColor = backgroundlight;
      case AppTheme.dark:
        _themeData = _buildDarkTheme();
        _backgroundColor = backgrounddark;
        break;
    }
    notifyListeners();
  }

  ThemeData _buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        background: backgroundlight, // Fondo claro
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: secondary,
      colorScheme: const ColorScheme.dark(
        background: backgrounddark, // Fondo oscuro
      ),
    );
  }
}
