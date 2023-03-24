import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../bloc/application_create_cubit.dart';
import '../model/models.dart';
import '../widgets/application_create_toolbar.dart';

class ApplicationCreatePage extends StatefulWidget {
  const ApplicationCreatePage({
    super.key,
  });

  @override
  State<ApplicationCreatePage> createState() => _ApplicationCreatePageState();
}

class _ApplicationCreatePageState extends State<ApplicationCreatePage> with MixinMessages, MixinMessages {
  late final ApplicationCreateCubit _bloc = BlocProvider.of<ApplicationCreateCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationCreateCubit, ApplicationCreateState>(
      listener: (BuildContext context, ApplicationCreateState state) => _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state is ApplicationCreateStateProgress,
          child: ApplicationCreateToolbar(
            onSwitchedLanguage: () => _languageChanged(context),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
            child: Card(
              elevation: 2,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.feature_application_Input_title,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateNameChange,
                        decoration: InputDecoration(
                          errorText: state.nameInput?.errorL10n(context),
                          hintText: context.l10n.feature_application_Input_hint,
                          hintStyle: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        context.l10n.feature_application_identifier,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateApplicationIdentifier,
                        decoration: InputDecoration(
                          errorText: state.applicationIdentifierInput?.errorL10n(context),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  EnvironmentConfig.IDENTIFIER_PREFIX,
                                  style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                                        color: Colors.black54,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                        title: context.l10n.common_feature_create,
                        onPressed: () => _bloc.validateAndTryCreateApplication(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(ApplicationCreateState state) {
    if (state is ApplicationCreateStateError) {
      showFailureMessage(context, state.exception.toString());
    }
    if (state is ApplicationCreateStateSuccess) {
      _openApplications();
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openApplications() {
    GoRouter.of(context).pushNamed(AppRoutInfo.applicationCollection.name);
  }
}
