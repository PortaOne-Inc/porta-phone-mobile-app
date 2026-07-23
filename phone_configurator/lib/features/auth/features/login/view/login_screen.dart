import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/features/auth/extensions/extensions.dart';
import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../bloc/bloc.dart';
import '../extensions/extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required this.title, this.onLogin, super.key});

  final String title;
  final VoidCallback? onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with MixinMessages {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final commonBloc = context.read<CommonBloc>();
    final authCubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: _listenAuthState,
      builder: (ctx, state) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800, minWidth: 200, maxHeight: 528, minHeight: 200),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: AutofillGroup(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(opacity: state is AuthStateProgress ? 1.0 : 0.0, child: const LinearProgressIndicator()),
                    const SizedBox(height: 16),
                    ThemeModeSwitcher(themeMode: commonBloc.state.themeMode, onThemeChange: commonBloc.setThemeMode),
                    const SizedBox(height: 16),
                    Text(widget.title, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 32),
                    TextFormField(
                      initialValue: state.emailInput?.value,
                      onChanged: authCubit.authEmailChanged,
                      decoration: InputDecoration(
                        hintText: context.l10n.authorization_enter_email_hint,
                        errorText: state.emailInput?.errorL10n(context),
                      ),
                      autofillHints: const [AutofillHints.email],
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
                          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          }),
                        ),
                      ),
                      autofillHints: const [AutofillHints.password],
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: authCubit.validateAndTryLogin,
                      child: Text(context.l10n.authorization_sign_in),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listenAuthState(BuildContext context, LoginState state) {
    if (state is AuthStateError) {
      showFailureMessage(context, state.error?.errorL10n(context) ?? '');
    }

    if (state is AuthStateSuccess) {
      widget.onLogin?.call();
    }
  }
}
