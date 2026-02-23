import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/auth/extensions/extensions.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/bloc.dart';

import '../extensions/extensions.dart';
import '../widgets/toolbar_reset.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> with MixinMessages {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: _listenResetState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state is ResetPasswordStateProgress,
            child: ResetToolbar(onLanguageChanged: () {}),
          ),
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
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 64,
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context
                              .l10n
                              .feature_auth_reset_toolbar_recover_account,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          onChanged: (it) =>
                              BlocProvider.of<ResetPasswordCubit>(
                                context,
                              ).authEmailChanged(it),
                          initialValue: state.emailInput?.value,
                          decoration: InputDecoration(
                            hintText:
                                context.l10n.authorization_enter_email_hint,
                            errorText: state.emailInput?.errorL10n(context),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Button(
                          title: context.l10n.authorization_sign_in,
                          onPressed: () => _tryToReset(context),
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

  void _listenResetState(BuildContext context, ResetPasswordState state) {
    if (state is ResetPasswordStateError) {
      showFailureMessage(context, state.error!.errorL10n(context));
    }
    if (state is ResetPasswordStateSuccess) {
      GoRouter.of(context).goNamed(AppRoutInfo.login.name);
      showTopSnakeMessageSuccess(
        context,
        context.l10n.feature_auth_reset_success,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void _tryToReset(BuildContext context) {
    BlocProvider.of<ResetPasswordCubit>(context).validateAndTryLogin();
  }
}
