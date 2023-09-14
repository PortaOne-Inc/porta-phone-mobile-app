import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/app/application.dart';

import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/features/themes/features/theme_create/extension/extension.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/theme_create_cubit.dart';
import '../widgets/widgets.dart';

class ThemeCreatePage extends StatefulWidget {
  const ThemeCreatePage({
    super.key,
  });

  @override
  State<ThemeCreatePage> createState() => _ThemeCreatePageState();
}

class _ThemeCreatePageState extends State<ThemeCreatePage> with MixinMessages, MixinMessages {
  late final ThemeCreateCubit _bloc = BlocProvider.of<ThemeCreateCubit>(context);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;
    return BlocConsumer<ThemeCreateCubit, ThemeCreateState>(
      listener: (BuildContext context, ThemeCreateState state) => _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state.status == ThemeCreateStateStatus.progress,
          child: ThemeCreateToolbar(
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
                        maxLength: 24,
                        decoration: InputDecoration(
                            errorText: state.nameInput?.errorL10n(context),
                            hintText: context.l10n.feature_application_Input_title,
                            // hintStyle: textScheme.bodyMedium,
                            suffixIcon: Tooltip(
                              message: context.l10n.feature_application_create_Tooltip_name_info,
                              child: Icon(
                                Icons.info_outlined,
                                color: colorScheme.secondary,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                        title: context.l10n.feature_theme_create,
                        onPressed: () => _bloc.tryCreateTheme(),
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

  void _listenAppCreateState(ThemeCreateState state) {
    if (state.status == ThemeCreateStateStatus.error) {
      showFailureMessage(context, state.error.toString());
    }
    if (state.status == ThemeCreateStateStatus.success) {
      GoRouter.of(context).pushNamed(
        AppRoutInfo.applicationDetails.name,
        pathParameters: <String, String>{
          AppRoutInfo.keyApplicationId: _bloc.applicationId,
        },
      );
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
