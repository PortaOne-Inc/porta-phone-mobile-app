import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../../../widgets/widgets.dart';

import '../bloc/application_edit_cubit.dart';

class ApplicationEditPage extends StatefulWidget {
  const ApplicationEditPage({super.key});

  @override
  State<ApplicationEditPage> createState() => _ApplicationEditPageState();
}

class _ApplicationEditPageState extends State<ApplicationEditPage>
    with MixinMessages {
  late final ApplicationEditCubit _bloc = BlocProvider.of<ApplicationEditCubit>(
    context,
  );

  final _identifierEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ApplicationEditCubit, ApplicationEditState>(
      listener: (BuildContext context, ApplicationEditState state) =>
          _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.l10n.feature_application_Toolbar_edit,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            ThemeModeSwitcher(
              themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
              onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            ),
          ],
        ),
        body: Center(
          child: ApplicationManage(
            key: ValueKey(state.status),
            updateName: _bloc.updateNameChange,
            updateAndroidPlatformId: _bloc.updateAndroidPlatformId,
            updateIosPlatformId: _bloc.updateIosPlatformId,
            updateAndroidBuildName: _bloc.updateAndroidBuildName,
            updateAndroidBuildNumber: _bloc.updateAndroidBuildNumber,
            updateIosBuildName: _bloc.updateIosBuildName,
            updateIosBuildNumber: _bloc.updateIosBuildNumber,
            nameInput: state.nameInput,
            androidPlatformIdInput: state.androidPlatformIdInput,
            iosPlatformIdInput: state.iosPlatformIdInput,
            androidBuildNameInput: state.androidBuildNameInput,
            androidBuildNumberInput: state.androidBuildNumberInput,
            iosBuildNameInput: state.iosBuildNameInput,
            iosBuildNumberInput: state.iosBuildNumberInput,
            actionManage: _bloc.validateAndTryCreateApplication,
            action: context.l10n.theme_update,
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(ApplicationEditState state) {
    if (state.status == ApplicationEditStatus.error) {
      showFailureMessage(context, state.exception ?? 'Unknown error');
    }
    if (state.status == ApplicationEditStatus.finish) {
      _openApplications();
    }
    if (state.status == ApplicationEditStatus.initial) {
      _identifierEditController.text = state.nameInput!.value;
    }
  }

  void _openApplications() {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
