import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_phone/data/data.dart';

import '../model/models.dart';
import 'mock_app_preferences.dart';
import 'page_theme_preview.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  const PageThemeEdit({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<PageThemeEdit> createState() => _PageThemeEditState();
}

class _PageThemeEditState extends State<PageThemeEdit> {
  final _leftPageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Left edit theme page');
  final _rightPageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Right edit theme page');

  @override
  void dispose() {
    _leftPageNavigatorKey.currentState?.dispose();
    _rightPageNavigatorKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<UpdateThemCubit, UpdateThemeState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        final theme = state.toThemeSettings();

        return Scaffold(
          appBar: _AppBar(
            state: state,
            onThemeChange: (mode) => context.read<CommonBloc>().setThemeMode(mode),
            onFileMenuSelect: (item) => _handleFileMenuSelection(context, item),
            onThemeMenuSelect: (item) => _handleThemeMenuSelection(context, item),
          ),
          body: ThemeProvider(
            settings: theme,
            lightDynamic: null,
            darkDynamic: null,
            child: Builder(
                builder: (context) => ResizableColumns(
                      orientation: ResizableOrientation.horizontal,
                      dividerColor: colorScheme.surfaceContainerLow,
                      dividerThickness: 4,
                      minChildSize: 200,
                      initialProportions: const [.65, .35],
                      children: [
                        (context) => const SingleStack(
                              key: ValueKey('leftStack'),
                              child: PageThemeProperty(),
                            ),
                        (context) => FutureProvider<FeatureAccess>(
                              key: ValueKey('${state.appConfig}${state.status}'),
                              create: (context) async {
                                final appConfig = state.appConfig;
                                return FeatureAccess.init(appConfig, MockAppPreferences());
                              },
                              initialData: FeatureAccess.init(state.appConfig, MockAppPreferences()),
                              child: SingleStack(
                                navigator: _rightPageNavigatorKey,
                                key: const ValueKey('rightStack'),
                                child: const PageThemePreview(),
                              ),
                            ),
                      ],
                    )),
          ),
        );
      },
    );
  }

  void _handleStateChanges(BuildContext context, UpdateThemeState state) {
    if (state.isHasError) {
      _showErrorDialog(context, state.error);
    }
  }

  void _showErrorDialog(BuildContext context, Object? error) {
    final message =
        (error is ThemeIsNotValidException) ? 'The theme is not valid.' : error?.toString() ?? 'An error occurred.';

    showDialog<void>(
      context: context,
      builder: (BuildContext context) => FailureDialog(message: message),
    );
  }

  void _handleFileMenuSelection(BuildContext context, ApplicationEditFile action) {
    final cubit = context.read<UpdateThemCubit>();

    if (action == ApplicationEditFile.save) {
      cubit.add(UpdateThemeEvent(cubit.state.theme));
    }
  }

  void _handleThemeMenuSelection(BuildContext context, ApplicationEditTheme action) {
    final cubit = context.read<UpdateThemCubit>();

    if (action == ApplicationEditTheme.preview) {
      GoRouter.of(context).goNamed(
        AppRoutInfo.themesPreview.name,
        pathParameters: {
          AppRoutInfo.keyApplicationId: cubit.applicationId!,
          AppRoutInfo.keyThemeId: cubit.themeId!,
        },
      );
    }
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.state,
    required this.onThemeChange,
    required this.onFileMenuSelect,
    required this.onThemeMenuSelect,
  });

  final UpdateThemeState state;
  final ValueChanged<ThemeMode> onThemeChange;
  final void Function(ApplicationEditFile) onFileMenuSelect;
  final void Function(ApplicationEditTheme) onThemeMenuSelect;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.read<CommonBloc>().state.themeMode;

    return AppToolbar(
      isVisibleProgress: state.isProgress,
      themeMode: themeMode,
      onThemeChange: onThemeChange,
      name: 'Applications',
      left: [
        Menu<ApplicationEditFile>(
          name: 'File',
          items: ApplicationEditFile.values,
          callback: (context, item) => onFileMenuSelect(item),
        ),
        Menu<ApplicationEditTheme>(
          name: 'Theme',
          items: ApplicationEditTheme.values,
          callback: (context, item) => onThemeMenuSelect(item),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
