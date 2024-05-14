import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../widgets/widgets.dart';

import '../bloc/application_create_cubit.dart';
import '../widgets/widgets.dart';

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
          isVisibleProgress: state.status == ApplicationCreateStatus.loading,
          child: ApplicationCreateToolbar(
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            onSwitchedLanguage: () => _languageChanged(context),
          ),
        ),
        body: Center(
          child: ApplicationManage(
            updateName: _bloc.updateNameChange,
            updateIdentifier: _bloc.updateApplicationIdentifier,
            updateAndroidPlatformId: _bloc.updateAndroidPlatformId,
            updateIosPlatformId: _bloc.updateIosPlatformId,
            updateAndroidBuildName: _bloc.updateAndroidBuildName,
            updateAndroidBuildNumber: _bloc.updateAndroidBuildNumber,
            updateIosBuildName: _bloc.updateIosBuildName,
            updateIosBuildNumber: _bloc.updateIosBuildNumber,
            onChangedCoreInput: _bloc.updateCore,
            onChangedTermsConditionsInput: _bloc.updateTermsConditions,
            updateAndroidGoogleService: _bloc.chooseAndroidServices,
            updateIosGoogleService: _bloc.chooseIosGoogleServices,
            nameInput: state.nameInput,
            applicationIdentifierInput: state.applicationIdentifierInput,
            androidPlatformIdInput: state.androidPlatformIdInput,
            iosPlatformIdInput: state.iosPlatformIdInput,
            androidBuildNameInput: state.androidBuildNameInput,
            androidBuildNumberInput: state.androidBuildNumberInput,
            iosBuildNameInput: state.iosBuildNameInput,
            iosBuildNumberInput: state.iosBuildNumberInput,
            applicationCoreInput: state.applicationCoreInput,
            applicationTermsConditionsInput: state.applicationTermsConditionsInput,
            actionManage: _bloc.validateAndTryCreateApplication,
            isAndroidGoogleServiceSelected: state.androidGoogleServices != null,
            isIosGoogleServiceSelected: state.iosGoogleServices != null,
            action: context.l10n.common_feature_create,
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(ApplicationCreateState state) {
    if (state.status == ApplicationCreateStatus.error) {
      showFailureMessage(context, state.exception.toString());
    }
    if (state.status == ApplicationCreateStatus.success) {
      _openApplications();
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openApplications() {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
