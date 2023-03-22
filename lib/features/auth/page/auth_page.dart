import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/features/auth/extensions/extensions.dart';

import '../bloc/bloc.dart';
import '../widgets/toolbar_auth.dart';

class AuthPage extends StatelessWidget with MixinMessages {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) => _listenAuthState(context, state),
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state is AuthStateProgress,
            child: VendorsToolbar(
              onLanguageChanged: () => _languageChanged(context),
            ),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800, minWidth: 200, maxHeight: 528, minHeight: 200),
              child: SingleChildScrollView(
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.authorization_title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          onChanged: (it) => BlocProvider.of<AuthCubit>(context).authEmailChanged(it),
                          initialValue: state.emailInput?.value,
                          decoration: InputDecoration(
                            hintText: context.l10n.authorization_enter_email_hint,
                            errorText: state.emailInput?.errorL10n(context),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          onChanged: (it) => BlocProvider.of<AuthCubit>(context).authPasswordChanged(it),
                          initialValue: state.passwordInput?.value,
                          decoration: InputDecoration(
                            hintText: context.l10n.authorization_enter_password_hint,
                            errorText: state.passwordInput?.errorL10n(context),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Button(
                          title: context.l10n.authorization_sign_in,
                          onPressed: () => _tryLogin(context),
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

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _listenAuthState(BuildContext context, AuthState state) {
    if (state is AuthStateError) {
      showFailureMessage(context, state.error.toString());
    }
    if (state is AuthStateSuccess) {
      GoRouter.of(context).goNamed(AppRoutInfo.vendors.name);
      showTopSnakeMessageSuccess(context, context.l10n.feature_auth_SnakeBar_success_auth);
    }
  }

  void _tryLogin(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).validateAndTryLogin();
  }
}
