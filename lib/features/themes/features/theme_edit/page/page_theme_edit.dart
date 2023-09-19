import 'package:domain/domain.dart';
import 'package:domain/entity/models/image/system_assets_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../model/exception/exception.dart';
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
        appBar: BaseToolBar(
          isVisibleProgress: state is ThemePropertyProgressState,
          child: ThemesEditToolbar(
            title: widget.title,
            onSaveTheme: () => _updateTheme(context),
            onLogout: () => BlocProvider.of<CommonBloc>(context).logout(),
            onPreload: () => _openTemplates(state),
            onImportAssetsFromSvg: () => _importAssetsFromSvg(state),
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => BlocProvider.of<CommonBloc>(context).setThemeMode(mode),
          ),
        ),
        body: FlexibleBinaryLayout(
          // Move left vertical divider
          // dividerPosition: -MediaQuery.of(context).size.width / 5,
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

  void _openTemplates(ThemePropertyState state) {
    _leftPageNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Center(
            child: PreloadPicker(
              current: state.theme!.colors!,
              onDeclineColor: () => Navigator.of(context).pop(),
              onSelect: (scheme) => BlocProvider.of<ThemePropertyCubit>(context).add(ReplaceColorSchemeEvent(scheme)),
            ),
          );
        },
      ),
    );
  }

  void _importAssetsFromSvg(ThemePropertyState state) async {
    final result = await _leftPageNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext context) => const ImportAssetsSvg(),
      ),
    );

    if (result is SystemAssetsModel) {
      if (mounted) {
        BlocProvider.of<ThemePropertyCubit>(context).add(UpdateThemeSchemeEvent.updateSystemAssetsImages(result));
      }
    }
  }

  void _listenSynchronizeState(BuildContext context, ThemePropertyState state) {
    if (state is ThemePropertyErrorState) {
      if (state.error is ThemeIsNotValidException) {
        _showFailureMessage(context, context.l10n.feature_theme_is_not_valid);
      } else {
        _showFailureMessage(context, state.error?.message ?? context.l10n.common_failure_message);
      }
    }
  }

  void _showFailureMessage(BuildContext context, String message) {
    final dialog = FailureDialog(message: message);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void _updateTheme(BuildContext context) {
    final theme = BlocProvider.of<ThemePropertyCubit>(context).state.theme;
    BlocProvider.of<ThemePropertyCubit>(context).add(UpdateThemeEvent((theme)));
  }
}
