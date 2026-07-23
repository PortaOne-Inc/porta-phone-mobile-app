import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterWrapper extends Router<dynamic> {
  GoRouterWrapper({required GoRouter router, super.key})
    : super(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}
