import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

class AuthReloginTrigger extends StatelessWidget {
  const AuthReloginTrigger({
    required this.onRelogin,
    required this.child,
    super.key,
  });

  final VoidCallback onRelogin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          onRelogin();
        }
      },
      child: child,
    );
  }
}
