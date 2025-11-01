import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patriom/core/patriom_const.dart';
import 'package:patriom/ui/screens/home_page.dart';
import 'package:patriom/ui/screens/unknown_route_screen.dart';
import 'package:patriom/ui/widgets/patriom_bottom_navigation_bar.dart';

class PatriomRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: PatriomConst.home,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return PatriomBottomNavigationBar(stateLocation: state.matchedLocation, child: child);
        },
        routes: [
          GoRoute(
            path: PatriomConst.home,
            pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: PatriomConst.stats,
            pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: PatriomConst.settings,
            pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: UnknownRouteScreen(),
    ),
  );
}