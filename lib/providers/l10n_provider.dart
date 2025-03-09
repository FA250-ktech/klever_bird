import 'package:flutter/material.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/services/navigation_service.dart';

class L10nProvider extends ChangeNotifier {
  final NavigationService _navService = locator<NavigationService>();

  void popOrGo() {
    _navService.popOrGo();
  }

  Locale currentLocale = const Locale('en');

  void setLocale(Locale? locale) {
    if (locale != null) {
      currentLocale = locale;
      if (currentLocale == const Locale('en')) {
        selectedLocale = 'English';
      } else if (currentLocale == const Locale('ms')) {
        selectedLocale = 'Bahasa Melayu';
      } else if (currentLocale == const Locale('zh')) {
        selectedLocale = '中文';
      }
    }
  }

  List<String> localeDropDownList = [
    'English',
    'Bahasa Melayu',
    '中文',
  ];

  String selectedLocale = 'English';
  void selectLocale(dynamic value) {
    final choice = localeDropDownList.firstWhere(
      (element) => element == value,
      orElse: () => '-1',
    );

    if (choice == '-1') {
      selectedLocale = 'English';
      setLocale(const Locale('en'));
      return;
    }

    selectedLocale = choice;
    switch (selectedLocale) {
      case 'English':
        setLocale(const Locale('en'));
        break;
      case 'Bahasa Melayu':
        setLocale(const Locale('ms'));
        break;
      case '中文':
        setLocale(const Locale('zh'));
        break;
    }

    notifyListeners();
  }
}
