import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../../../app/route/app_route_consts.dart';
import '../bloc/bloc.dart';

final _logger = Logger('AuthReLoginShell');

class AuthReLoginShell extends StatefulWidget {
  const AuthReLoginShell({
    required this.child,
    required this.relogin,
    super.key,
  });

  final Widget child;
  final Widget relogin;

  @override
  State<AuthReLoginShell> createState() => _AuthReLoginShellState();
}

class _AuthReLoginShellState extends State<AuthReLoginShell>
    with MixinMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleAuthState(context, context.read<AuthCubit>().state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _handleAuthState,
      child: widget.child,
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    final router = GoRouter.of(context);
    _logger.info('Auth state: $state');

    switch (state.status) {
      case AuthenticationStatus.unauthenticated:
        router.goNamed(AppRoutInfo.login.name);
      case AuthenticationStatus.expired:
        _showReLoginDialog(context, router);
      case AuthenticationStatus.authenticated:
        showTopSnakeMessageSuccess(
          context,
          context.l10n.feature_auth_SnakeBar_success_auth,
        );
      case null:
    }
  }

  void _showReLoginDialog(BuildContext context, GoRouter router) {
    _logger.info('Showing re-login dialog');

    final currentPath = router.state.fullPath;
    final loginPath = AppRoutInfo.login.path;

    if (currentPath != loginPath && mounted) {
      showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(child: widget.relogin),
      );
    }
  }
}
