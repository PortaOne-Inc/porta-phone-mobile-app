import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/features/theme_edit/model/exception/exception.dart';
import 'package:webtrit_configurator/share/mixin/mixin_messages.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

import '../../common/common.dart';
import '../theme_edit.dart';
import '../widgets/widgets.dart';

import 'page_theme_preview.dart';

class PageThemeEdit extends StatelessWidget with MixinMessages {
  const PageThemeEdit({
    super.key,
    required this.swaggerUrl,
  });

  final String swaggerUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
      listener: (BuildContext context, ThemePropertyState state) => _listenSynchronizeState(context, state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state is ThemePropertyProgressState,
          child: ThemesEditToolbar(
            onSaveTheme: () => _updateTheme(context),
            onLogout: () => BlocProvider.of<CommonBloc>(context).logout(),
            onApiCredential: () => BlocProvider.of<ThemePropertyCubit>(context).showThemeCredential(),
            onApiEndpoints: () => _openSwaggerDocs(),
          ),
        ),
        body: const BackgroundBinaryResizableColumn(
          leftChild: SingleStack(
            child: PageThemeProperty(),
          ),
          rightChild: SingleStack(
            child: PageThemePreview(),
          ),
        ),
      ),
    );
  }

  Future<void> _openSwaggerDocs() async {
    if (!await launchUrl(Uri.parse(swaggerUrl))) {
      throw Exception('Could not launch $swaggerUrl');
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

    if (state is ThemePropertCredentialsState) {
      showDialog(
        context: context,
        builder: (context) => CredentialToolbar(
          userId: state.userId!,
          themeId: state.themeId!,
          applicationId: state.applicationId!,
        ),
      );
    }
  }

  void _showFailureMessage(BuildContext context, String message) {
    final dialog = FailureDialog(message: message);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void _updateTheme(
    BuildContext context,
  ) {
    final theme = BlocProvider.of<ThemePropertyCubit>(context).state.theme;
    BlocProvider.of<ThemePropertyCubit>(context).validateAndTryUpdateTheme(theme);
  }
}
