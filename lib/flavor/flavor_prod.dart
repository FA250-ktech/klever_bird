import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/main.dart';
import 'package:kleverbird/providers/theme_provider.dart';

Future<void> main() async {
  FlavorConfig(
    color: Colors.transparent,
    variables: {
      "env": "production",
    },
  );

  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await Future.delayed(Duration(seconds: 1));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await _initializeEssentialServices();

  runApp(const KleverbirdApp());
}

Future<void> _initializeEssentialServices() async {
  await Future.wait([
    locator<ThemeService>().initThemeMode().catchError((e) {
      print('Error in initThemeMode: $e');
    }),
  ]);
}
