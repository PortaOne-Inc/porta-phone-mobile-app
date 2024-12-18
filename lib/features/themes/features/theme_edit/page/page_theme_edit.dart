import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator_cubit.dart';
import '../model/models.dart';

import 'page_theme_preview.dart';
import 'page_theme_property.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  PageThemeEdit({
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
  Widget build(BuildContext context) {
    return BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
      listener: _listenSynchronizeState,
      builder: (ctx, state) => Scaffold(
        appBar: AppToolbar(
          isVisibleProgress: state.isProgress,
          themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
          onThemeChange: (mode) => BlocProvider.of<CommonBloc>(context).setThemeMode(mode),
          name: context.l10n.feature_applications_title,
          left: [
            Menu<ApplicationEditFile>(
              name: 'File',
              items: ApplicationEditFile.values,
              callback: _onMenuFileSelect,
            ),
            Menu<ApplicationEditTheme>(
              name: 'Theme',
              items: ApplicationEditTheme.values,
              callback: _onMenuThemeSelect,
            ),
          ],
        ),
        body: ResizableColumns(
          orientation: ResizableOrientation.horizontal,
          dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
          dividerThickness: 4,
          minChildSize: 200,
          children: [
            (context) => ConditionalProgressBar(
                  condition: state.theme != null,
                  child: SingleStack(
                    key: const ValueKey('leftStack'),
                    navigator: _leftPageNavigatorKey,
                    child: const PageThemeProperty(),
                  ),
                ),
            (context) => SingleStack(
                  key: const ValueKey('rightStack'),
                  navigator: _rightPageNavigatorKey,
                  child: const PageThemePreview(),
                ),
          ],
        ),
      ),
    );
  }

  void _listenSynchronizeState(BuildContext context, ThemePropertyState state) {
    if (state.isHasError) {
      if (state.error is ThemeIsNotValidException) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => FailureDialog(
            message: context.l10n.feature_theme_is_not_valid,
          ),
        );
      } else {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => FailureDialog(
            message: state.error?.toString() ?? context.l10n.common_failure_message,
          ),
        );
      }
    }
  }

  void _onMenuFileSelect(BuildContext context, ApplicationEditFile profile) {
    final bloc = BlocProvider.of<ThemePropertyCubit>(context);
    switch (profile) {
      case ApplicationEditFile.save:
        bloc.add(UpdateThemeEvent(bloc.state.theme));
      case ApplicationEditFile.download:
        bloc.add(const DownloadThemeEvent());
    }
  }

  void _onMenuThemeSelect(BuildContext context, ApplicationEditTheme profile) {
    final bloc = BlocProvider.of<ThemePropertyCubit>(context);
    switch (profile) {
      case ApplicationEditTheme.preview:
        GoRouter.of(context).goNamed(
          AppRoutInfo.themesPreview.name,
          pathParameters: <String, String>{
            AppRoutInfo.keyApplicationId: bloc.applicationId!,
            AppRoutInfo.keyThemeId: bloc.themeId!
          },
        );
    }
  }
}
