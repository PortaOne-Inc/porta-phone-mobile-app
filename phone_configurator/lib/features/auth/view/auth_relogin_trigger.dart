import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

/// Re-runs [onRelogin] when the session recovers after a token expiry.
///
/// The re-login screen is shown on top of the current page while the token is
/// [AuthenticationStatus.expired], so the page stays mounted with whatever
/// (possibly failed) state its data load left behind. This fires only on the
/// `expired -> authenticated` transition, letting the page re-initialize its
/// data once the session is valid again.
class AuthReloginTrigger extends StatelessWidget {
  const AuthReloginTrigger({required this.onRelogin, required this.child, super.key});

  final VoidCallback onRelogin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.status == AuthenticationStatus.expired && current.status == AuthenticationStatus.authenticated,
      listener: (context, state) => onRelogin(),
      child: child,
    );
  }
}
