import 'package:flutter/material.dart';
import 'package:kleverbird/go_router.dart';
import 'package:kleverbird/helpers/constants/route_names.dart';
import 'package:kleverbird/locator.dart';

class NavigationService {
  final _routerService = locator<RouterService>();

  BuildContext getCurrentContext() =>
      _routerService.router.routerDelegate.navigatorKey.currentContext!;

  void push(String routeName) {
    _routerService.router.push(routeName);
  }

  void pushNamed({
    required String routeName,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) {
    _routerService.router.pushNamed(
      routeName,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }

  void pushReplacement(String routePath) {
    _routerService.router.pushReplacement(routePath);
  }

  void go(String routeName) {
    _routerService.router.go(routeName);
  }

  void goNamed({
    required String routeName,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) {
    _routerService.router.goNamed(
      routeName,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }

  void pop() => _routerService.router.pop();

  void pushNamedAndRemoveUntil(String routeName) {
    while (_routerService.router.canPop()) {
      _routerService.router.pop();
    }

    _routerService.router.pushReplacement(routeName);
    //_routerService.router.go(routeName);
  }

  void popOrGo() {
    if (_routerService.router.canPop()) {
      _routerService.router.pop();
    } else {
      _routerService.router.goNamed(samplePageRoute.routeName);
    }
  }
}
