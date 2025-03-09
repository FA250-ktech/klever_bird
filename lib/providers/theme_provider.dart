import 'package:flutter/material.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/services/navigation_service.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeService _themeService = locator<ThemeService>();
  final NavigationService _navService = locator<NavigationService>();

  ThemeMode get themeMode => _themeService.themeMode;

  void setThemeMode(ThemeMode selectedTheme) {
    _themeService.setThemeMode(selectedTheme);
    notifyListeners();
  }

  void popOrGo() {
    _navService.popOrGo();
  }

  List<ThemeMode> themeList = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];
}

class ThemeService {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  Future<void> initThemeMode() async {
    _themeMode = ThemeMode.system;
  }

  void setThemeMode(ThemeMode selectedTheme) {
    _themeMode = selectedTheme;
  }
}
