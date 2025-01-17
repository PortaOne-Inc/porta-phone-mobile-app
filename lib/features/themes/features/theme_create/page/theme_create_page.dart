import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/app/application.dart';

import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/features/themes/features/theme_create/extension/extension.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/theme_create_cubit.dart';

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
        appBar: AppToolbar(
          isVisibleProgress: state.status == ThemeCreateStateStatus.progress,
          name: context.l10n.feature_theme_create_title,
          themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
          onThemeChange: (mode) => _onThemeModeChanged(context, mode),
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
                        context.l10n.feature_theme_create_title,
                        style: textScheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: _bloc.updateNameChange,
                        maxLength: 24,
                        initialValue: state.nameInput?.value,
                        decoration: InputDecoration(
                          errorText: state.nameInput?.errorL10n(context),
                          hintText: context.l10n.feature_theme_create_title,
                          suffixIcon: Tooltip(
                            message: context.l10n.feature_theme_create_title,
                            child: Icon(
                              Icons.info_outlined,
                              color: colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Description',
                        style: textScheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        onChanged: (it) {},
                        maxLength: 24,
                        initialValue: "",
                        decoration: InputDecoration(
                          // errorText: state.nameInput?.errorL10n(context),
                          hintText: context.l10n.feature_theme_create_title,
                          suffixIcon: Tooltip(
                            message: context.l10n.feature_theme_create_title,
                            child: Icon(
                              Icons.info_outlined,
                              color: colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Button(
                        title: context.l10n.feature_theme_create,
                        onPressed: state.status.isProgress ? null : () => _bloc.tryCreateTheme(),
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
      GoRouter.of(context).goNamed(
        AppRoutInfo.applicationDetails.name,
        pathParameters: <String, String>{
          AppRoutInfo.keyApplicationId: _bloc.applicationId,
        },
      );
    }
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
