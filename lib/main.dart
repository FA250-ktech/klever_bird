import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:kleverbird/go_router.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class KleverbirdApp extends StatelessWidget {
  const KleverbirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => locator<ThemeProvider>(),
          lazy: true,
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => FlavorBanner(
          child: MaterialApp.router(
            routerConfig: locator<RouterService>().router,
            title: 'Klever Stock',
            debugShowCheckedModeBanner: false,
            themeMode: provider.themeMode,
          ),
        ),
      ),
    );
  }
}
