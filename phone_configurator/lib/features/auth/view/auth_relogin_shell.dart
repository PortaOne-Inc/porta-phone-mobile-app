import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../../../app/route/app_route_consts.dart';
import '../bloc/bloc.dart';
import '../features/welcome/welcome.dart';

final _logger = Logger('AuthReLoginShell');

class AuthReLoginShell extends StatefulWidget {
  const AuthReLoginShell({required this.child, required this.reloginBuilder, super.key});

  final Widget child;
  final WidgetBuilder reloginBuilder;

  @override
  State<AuthReLoginShell> createState() => _AuthReLoginShellState();
}

class _AuthReLoginShellState extends State<AuthReLoginShell> with MixinMessages {
  Route<void>? _reloginRoute;
  AuthenticationStatus? _previousStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleAuthState(context, context.read<AuthCubit>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(listener: _handleAuthState, child: widget.child);
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    _logger.info('Auth state: $state');

    switch (state.status) {
      case AuthenticationStatus.unauthenticated:
        _dismissReLogin(context);
        GoRouter.of(context).goNamed(AppRoutInfo.login.name);
      case AuthenticationStatus.expired:
        _showReLogin(context);
      case AuthenticationStatus.authenticated:
        _dismissReLogin(context);
        if (_previousStatus == AuthenticationStatus.expired) {
          showTopSnackMessageSuccess(context, context.l10n.feature_auth_snackBar_success_auth);
        }
      case null:
    }

    _previousStatus = state.status;
  }

  void _showReLogin(BuildContext context) {
    _logger.info('Showing re-login screen');

    if (_reloginRoute != null || !mounted) {
      return;
    }
    if (GoRouter.of(context).state.fullPath == AppRoutInfo.login.path) {
      return;
    }

    final route = MaterialPageRoute<void>(
      builder: (routeContext) => WelcomeScreen(child: widget.reloginBuilder(routeContext)),
    );
    _reloginRoute = route;
    Navigator.of(context, rootNavigator: true).push(route);
  }

  void _dismissReLogin(BuildContext context) {
    final route = _reloginRoute;
    if (route == null) {
      return;
    }
    _reloginRoute = null;
    Navigator.of(context, rootNavigator: true).removeRoute(route);
  }
}
