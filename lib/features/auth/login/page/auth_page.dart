import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../common/bloc/common_bloc.dart';
import '../bloc/bloc.dart';
import '../extensions/extensions.dart';
import '../bloc/auth_cubit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with MixinMessages {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final commonBloc = context.read<CommonBloc>();
    final authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: _listenAuthState,
      builder: (ctx, state) {
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 800,
                minWidth: 200,
                maxHeight: 528,
                minHeight: 200,
              ),
              child: SingleChildScrollView(
                child: Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: state is AuthStateProgress ? 1.0 : 0.0,
                          child: const LinearProgressIndicator(),
                        ),
                        const SizedBox(height: 16),
                        ThemeModeSwitcher(
                          themeMode: commonBloc.state.themeMode,
                          onThemeChange: commonBloc.setThemeMode,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.l10n.authorization_title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          initialValue: state.emailInput?.value,
                          onChanged: authCubit.authEmailChanged,
                          decoration: InputDecoration(
                            hintText: context.l10n.authorization_enter_email_hint,
                            errorText: state.emailInput?.errorL10n(context),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: _isPasswordVisible,
                          initialValue: state.passwordInput?.value,
                          onChanged: authCubit.authPasswordChanged,
                          decoration: InputDecoration(
                            hintText: context.l10n.authorization_enter_password_hint,
                            errorText: state.passwordInput?.errorL10n(context),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () => setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.titleSmall),
                            onPressed: () => GoRouter.of(context).goNamed(AppRoutInfo.reset.name),
                            child: Text(context.l10n.feature_authorization_reset_password),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Button(
                          title: context.l10n.authorization_sign_in,
                          onPressed: authCubit.validateAndTryLogin,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listenAuthState(BuildContext context, AuthState state) {
    if (state is AuthStateError) {
      showFailureMessage(context, state.error?.errorL10n(context) ?? '');
    }

    if (state is AuthStateSuccess) {
      GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
      showTopSnakeMessageSuccess(
        context,
        context.l10n.feature_auth_SnakeBar_success_auth,
      );
    }
  }
}
