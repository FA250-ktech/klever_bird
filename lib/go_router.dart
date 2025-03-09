import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kleverbird/helpers/constants/route_names.dart';
import 'package:kleverbird/pages/sample_page.dart';

class RouterService {
  GoRouter router = GoRouter(
    initialLocation: samplePageRoute.routePath,
    routes: [
      GoRoute(
        name: samplePageRoute.routeName,
        path: samplePageRoute.routePath,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SamplePage());
        },
      ),
    ],
  );
}
