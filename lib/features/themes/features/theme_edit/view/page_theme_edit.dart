import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  const PageThemeEdit({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;

  final List<Router<dynamic>> children;

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
        final themeMode = context.watch<CommonBloc>().state.themeMode;

        return Scaffold(
          appBar: AppToolbar(
            isVisibleProgress: state.isProgress,
            themeMode: themeMode,
            onThemeChange: (mode) => context.read<CommonBloc>().setThemeMode(mode),
            name: 'Applications',
            left: [
              Menu<ApplicationEditFile>(
                name: 'File',
                items: ApplicationEditFile.values,
                callback: _handleFileMenuSelection,
              ),
              Menu<ApplicationEditTheme>(
                name: 'Theme',
                items: ApplicationEditTheme.values,
                callback: _handleThemeMenuSelection,
              ),
            ],
          ),
          body: ThemeShellRoute(
            child: ResizableColumns(
              orientation: ResizableOrientation.horizontal,
              dividerColor: colorScheme.surfaceContainerLow,
              dividerThickness: 4,
              minChildSize: 200,
              initialProportions: const [.65, .35],
              children: widget.children.map((child) => (_) => child).toList(),
            ),
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
