import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/main.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import 'package:kleverbird/services/navigation_service.dart';
import 'package:kleverbird/services/shorebird_service.dart';

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
    locator<ShorebirdService>().checkAppPatch().then((value) {
      if (value != null) {
        print('ShorebirdService initialized with patch available: $value');
        locator<NavigationService>().goNamed(routeName: value);
      } else {
        print('ShorebirdService initialized with no patch available.');
      }
    }).catchError((e) {
      print('Error in ShorebirdService initialization: $e');
    }),
  ]);
}
