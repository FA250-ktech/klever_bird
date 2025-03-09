import 'package:get_it/get_it.dart';
import 'package:kleverbird/go_router.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import '../services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<RouterService>(() => RouterService());
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
  locator.registerFactory<ThemeProvider>(() => ThemeProvider());
}
