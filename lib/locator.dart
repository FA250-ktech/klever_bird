import 'package:get_it/get_it.dart';
import 'package:kleverbird/go_router.dart';
import 'package:kleverbird/providers/shorebird_provider.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import 'package:kleverbird/services/shorebird_service.dart';
import '../services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<RouterService>(() => RouterService());
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
  locator.registerLazySingleton<ShorebirdService>(() => ShorebirdService());
  locator.registerFactory<ThemeProvider>(() => ThemeProvider());
  locator.registerFactory<ShorebirdProvider>(() => ShorebirdProvider());
}
