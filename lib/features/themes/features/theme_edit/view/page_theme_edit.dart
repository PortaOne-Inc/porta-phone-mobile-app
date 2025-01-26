import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  const PageThemeEdit({
    required this.title,
    required this.schemeRoute,
    required this.previewRoute,
    super.key,
  });

  final String title;

  final GoRouter schemeRoute;
  final GoRouter previewRoute;

  @override
  State<PageThemeEdit> createState() => _PageThemeEditState();
}

class _PageThemeEditState extends State<PageThemeEdit> {
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
                        (context) => Router(
                              routerDelegate: widget.schemeRoute.routerDelegate,
                              routeInformationParser: widget.schemeRoute.routeInformationParser,
                              routeInformationProvider: widget.schemeRoute.routeInformationProvider,
                            ),
                        (context) => Router(
                              routerDelegate: widget.previewRoute.routerDelegate,
                              routeInformationParser: widget.previewRoute.routeInformationParser,
                              routeInformationProvider: widget.previewRoute.routeInformationProvider,
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

  void _handleThemeMenuSelection(BuildContext context, ApplicationEditTheme action) {}
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
