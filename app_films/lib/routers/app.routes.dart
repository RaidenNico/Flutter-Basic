import 'package:app_films/screens/imports/screens.dart';
import 'package:flutter/material.dart';

import '../models/route.model.dart';

class AppRoutes {
  static const String initialRoutes = 'home';
  static const String routeDetails = 'details';

  static final List<RouteModel> routes = <RouteModel>[
    RouteModel(
      route: initialRoutes,
      widget: const HomeScreen(),
    ),
    RouteModel(
      route: routeDetails,
      widget: const DetailsScreen(),
    )
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.widget});
    }
    return appRoutes;
  }
}
