// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:kleverbird/go_router.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/providers/l10n_provider.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class KleverbirdApp extends StatelessWidget {
  const KleverbirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<L10nProvider>(
          create: (context) => locator<L10nProvider>(),
          lazy: true,
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => locator<ThemeProvider>(),
          lazy: true,
        ),
      ],
      child: Consumer2<L10nProvider, ThemeProvider>(
        builder: (context, provider, themeProvider, child) => FlavorBanner(
          child: MaterialApp.router(
            routerConfig: locator<RouterService>().router,
            title: 'Klever Stock',
            debugShowCheckedModeBanner: false,
            locale: provider.currentLocale, // Default language
            themeMode: themeProvider.themeMode,
          ),
        ),
      ),
    );
  }
}
