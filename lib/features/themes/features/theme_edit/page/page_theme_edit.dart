import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../model/models.dart';
import '../theme_edit.dart';
import '../widgets/widgets.dart';

import 'page_theme_preview.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  PageThemeEdit({
    super.key,
    required this.title,
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
      listener: (BuildContext context, ThemePropertyState state) => _listenSynchronizeState(context, state),
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
        body: FlexibleBinaryLayout(
          childPrimary: (context, size) {
            return ConditionalProgressBar(
              condition: state.theme != null,
              //TODO: Don't like this implementation with SingleStack
              child: SingleStack(
                key: const ValueKey('leftStack'),
                navigator: _leftPageNavigatorKey,
                child: const PageThemeProperty(),
              ),
            );
          },
          //TODO: Don't like this implementation with SingleStack
          childSecondary: (context, size) {
            return SingleStack(
              key: const ValueKey('rightStack'),
              navigator: _rightPageNavigatorKey,
              child: const PageThemePreview(),
            );
          },
          orientation: ResizableOrientation.horizontal,
        ),
      ),
    );
  }

  void _openTemplates(ThemeModel themeModel) {
    _leftPageNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Center(
            child: PreloadPicker(
              current: themeModel.colors!,
              onDeclineColor: () => Navigator.of(context).pop(),
              onSelect: (scheme) => BlocProvider.of<ThemePropertyCubit>(context).add(ReplaceColorSchemeEvent(scheme)),
            ),
          );
        },
      ),
    );
  }

  void _listenSynchronizeState(BuildContext context, ThemePropertyState state) {
    if (state.isHasError) {
      if (state.error is ThemeIsNotValidException) {
        showDialog(
          context: context,
          builder: (BuildContext context) => FailureDialog(
            message: context.l10n.feature_theme_is_not_valid,
          ),
        );
      } else {
        showDialog(
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
        bloc.add(UpdateThemeEvent((bloc.state.theme)));
    }
  }

  void _onMenuThemeSelect(BuildContext context, ApplicationEditTheme profile) {
    final bloc = BlocProvider.of<ThemePropertyCubit>(context);
    switch (profile) {
      case ApplicationEditTheme.templates:
        _openTemplates(bloc.state.theme!);
    }
  }
}
