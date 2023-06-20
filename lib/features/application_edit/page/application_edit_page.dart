import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/app/application.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/mixin/mixin.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

import '../../common/bloc/common_bloc.dart';
import '../bloc/application_edit_cubit.dart';
import '../model/models.dart';
import '../widgets/application_edit_toolbar.dart';

class ApplicationEditPage extends StatefulWidget {
  const ApplicationEditPage({
    super.key,
  });

  @override
  State<ApplicationEditPage> createState() => _ApplicationEditPageState();
}

class _ApplicationEditPageState extends State<ApplicationEditPage> with MixinMessages {
  late final ApplicationEditCubit _bloc = BlocProvider.of<ApplicationEditCubit>(context);

  final _nameEditController = TextEditingController();

  final _identifierEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationEditCubit, ApplicationEditState>(
      listener: (BuildContext context, ApplicationEditState state) => _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state is ApplicationEditStateProgress,
          child: ApplicationEditToolbar(
            onSwitchedLanguage: () => _languageChanged(context),
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
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
                        controller: _nameEditController,
                        onChanged: _bloc.updateNameChange,
                        decoration: InputDecoration(
                          errorText: state.nameInput?.errorL10n(context),
                          hintText: context.l10n.feature_application_Input_hint,
                          hintStyle: Theme.of(ctx).textTheme.bodyMedium,
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
                        controller: _identifierEditController,
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
                                  style: Theme.of(ctx).textTheme.bodyMedium,
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
                        title: context.l10n.theme_update,
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

  void _listenAppCreateState(ApplicationEditState state) {
    if (state is ApplicationEditStateError) {
      showFailureMessage(context, state.exception.toString());
    }
    if (state is ApplicationEditStateSuccess) {
      _openApplications();
    }
    if (state is ApplicationEditStateInit) {
      _identifierEditController.text = state.nameInput!.value;
      _nameEditController.text = state.applicationIdentifierInput!.value;
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openApplications() {
    GoRouter.of(context).pushNamed(AppRoutInfo.applicationCollection.name);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
