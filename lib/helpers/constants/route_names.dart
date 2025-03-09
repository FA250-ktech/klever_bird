import 'package:kleverbird/helpers/constants/route_paths.dart' as routes;

final RouteInfo samplePageRoute = RouteInfo(
  routeName: 'sample',
  routePath: routes.samplePage,
);

class RouteInfo {
  const RouteInfo({
    required this.routeName,
    required this.routePath,
  });

  final String routeName;
  final String routePath;
}
