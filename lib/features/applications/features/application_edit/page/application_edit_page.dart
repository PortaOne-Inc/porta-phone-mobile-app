import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../../../widgets/widgets.dart';

import '../bloc/application_edit_cubit.dart';
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
          isVisibleProgress: state.status == ApplicationEditStatus.loading,
          child: ApplicationEditToolbar(
            onSwitchedLanguage: () => _languageChanged(context),
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
          ),
        ),
        body: Center(
          child: ApplicationManage(
            key: ValueKey(state.status),
            updateName: _bloc.updateNameChange,
            updateIdentifier: _bloc.updateApplicationIdentifier,
            onChangedCoreInput: _bloc.updateCore,
            nameInput: state.nameInput,
            applicationIdentifierInput: state.applicationIdentifierInput,
            applicationCoreInput: state.applicationCoreInput,
            actionManage: _bloc.validateAndTryCreateApplication,
            updateAndroidGoogleService: _bloc.chooseAndroidServices,
            isAndroidGoogleServiceSelected: state.isAndroidGoogleServiceSelected,
            updateIosGoogleService: _bloc.chooseIosGoogleServices,
            isIosGoogleServiceSelected: state.isIosGoogleServiceSelected,
            action: context.l10n.theme_update,
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(ApplicationEditState state) {
    if (state.status == ApplicationEditStatus.error) {
      showFailureMessage(context, state.exception.toString());
    }
    if (state.status == ApplicationEditStatus.success) {
      _openApplications();
    }
    if (state.status == ApplicationEditStatus.initial) {
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
