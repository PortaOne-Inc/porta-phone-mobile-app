import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/mixin/mixin_messages.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

import '../../common/common.dart';
import '../theme_edit.dart';
import '../widgets/widgets.dart';

import 'page_theme_preview.dart';

class PageThemeEdit extends StatefulWidget {
  const PageThemeEdit({
    super.key,
  });

  @override
  State<PageThemeEdit> createState() => _PageThemeEditState();
}

class _PageThemeEditState extends State<PageThemeEdit> with MixinMessages {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SynchronizeCubit, SynchronizeState>(
      listener: (BuildContext context, SynchronizeState state) => _listenSynchronizeState(state),
      builder: (ctx, state) => BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
        builder: (ctx, state) => Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state is SyncStateProgress,
            child: ThemesEditToolbar(
              onSaveTheme: _updateTheme,
              onSkipChanges: _notImplemented,
              onOpen: _notImplemented,
              onDownload: _notImplemented,
              onLanguageChanged: _notImplemented,
              onLogout: () => BlocProvider.of<CommonBloc>(context).logout(),
              onApiCredential: () {
                BlocProvider.of<SynchronizeCubit>(context).showThemeCredential();
              },
              onApiEndpoints: () {},
            ),
          ),
          body: const BackgroundBinaryResizableColumn(
            leftChild: PageThemeProperty(),
            rightChild: PageThemePreview(),
          ),
        ),
      ),
    );
  }

  void _listenSynchronizeState(SynchronizeState state) {
    if (state is ThemeEditSyncFailure) {
      _showFailureMessage(state.message);
    }

    if (state is ShowThemeCredentials) {
      showDialog(
        context: context,
        builder: (context) => CredentialToolbar(
          userId: state.userId,
          themeId: state.themeId,
          vendorId: state.vendorId,
        ),
      );
    }

    if (state is ThemeReadyState) {
      BlocProvider.of<ThemePropertyCubit>(context).setTheme(state.themeModel);
    }

    if (state is ThemeIsNotValidState) {
      _showFailureMessage(context.l10n.feature_theme_is_not_valid);
    }
  }

  void _showFailureMessage(String message) {
    final dialog = FailureDialog(message: message);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void _updateTheme() {
    final theme = BlocProvider.of<ThemePropertyCubit>(context).state.theme;
    BlocProvider.of<SynchronizeCubit>(context).validateAndTryUpdateTheme(theme);
  }

  void _notImplemented() {
    showTopSnakeMessageInfo(context, context.l10n.common_not_implemented);
  }
}
