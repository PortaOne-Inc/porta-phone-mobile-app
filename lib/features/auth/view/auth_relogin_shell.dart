import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/route/app_route_consts.dart';
import '../bloc/auth_cubit.dart';

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

class _AuthReLoginShellState extends State<AuthReLoginShell> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final currentPath = GoRouter.of(context).state?.fullPath;
        final welcomePath = AppRoutInfo.login.path  ;
        print('currentPath: $currentPath welcomePath: $welcomePath');
        if (state.status == AuthStatus.expired && currentPath != welcomePath) {
          // GoRouter.of(context).goNamed(AppRoutInfo.login.name);
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Dialog(
                child: widget.relogin,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return widget.child;
      },
    );
  }
}
