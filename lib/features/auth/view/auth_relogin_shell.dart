import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../../../app/route/app_route_consts.dart';
import '../bloc/bloc.dart';

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

class _AuthReLoginShellState extends State<AuthReLoginShell> with MixinMessages {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _handleAuthState,
      child: widget.child,
    );
  }

  void _handleAuthState(BuildContext context, AuthState state) {
    final router = GoRouter.of(context);
    final currentPath = router.state?.fullPath;
    final loginPath = AppRoutInfo.login.path;

    switch (state.status) {
      case AuthenticationStatus.unauthenticated:
        router.goNamed(AppRoutInfo.login.name);
      case AuthenticationStatus.expired:
        if (currentPath != loginPath) _showReLoginDialog(context);
      case AuthenticationStatus.authenticated:
        showTopSnakeMessageSuccess(
          context,
          context.l10n.feature_auth_SnakeBar_success_auth,
        );
      default:
    }
  }

  void _showReLoginDialog(BuildContext context) {
    if (mounted) {
      showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(child: widget.relogin),
      );
    }
  }
}
