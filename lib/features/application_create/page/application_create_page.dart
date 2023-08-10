import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/application_create/widgets/google_services_preview.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../common/bloc/common_bloc.dart';
import '../bloc/application_create_cubit.dart';
import '../model/applications_consts.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

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
                        style: textScheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateNameChange,
                        maxLength: ApplicationConsts.maxNameLimit,
                        decoration: InputDecoration(
                            errorText: state.nameInput?.errorL10n(context),
                            hintText: context.l10n.feature_application_Input_title,
                            hintStyle: textScheme.bodyMedium,
                            suffixIcon: Tooltip(
                              message: context.l10n.feature_application_create_Tooltip_name_info,
                              child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                            )),
                      ),
                      Text(
                        context.l10n.feature_application_identifier,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateApplicationIdentifier,
                        maxLength: ApplicationConsts.maxIdentifierLimit,
                        decoration: InputDecoration(
                          errorText: state.applicationIdentifierInput?.errorL10n(context),
                          suffixIcon: Tooltip(
                            message: context.l10n.feature_application_create_Tooltip_identifier_info,
                            child: Icon(Icons.info_outlined, color: colorScheme.secondary),
                          ),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  EnvironmentConfig.IDENTIFIER_PREFIX,
                                  style: textScheme.bodyMedium?.copyWith(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Google services: ',
                            style: textScheme.labelLarge,
                          ),
                          Tooltip(
                            message:
                                'The google-services.json file is typically generated by the Google Play Console when you add a new app to your project.',
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.info_outline,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          GoogleServicesPreview(
                            platform: TargetPlatform.android,
                            isAttached: state.androidGoogleServices != null,
                            onTap: _bloc.chooseIosAndroidServices,
                          ),
                          const SizedBox(width: 16),
                          GoogleServicesPreview(
                            isAttached: state.iosGoogleServices != null,
                            platform: TargetPlatform.iOS,
                            onTap: _bloc.chooseIosGoogleServices,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
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
