import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/features/themes/models/models.dart';

import '../../../../../widgets/menu_preview.dart';

class PreviewShellRoute extends StatelessWidget {
  const PreviewShellRoute({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final previewCubit = context.watch<PreviewThemeCubit>();

    return BlocBuilder<PreviewThemeCubit, PreviewThemeState>(builder: (BuildContext context, PreviewThemeState state) {
      return Scaffold(
        appBar: MenuPreviewToolbar(
          onScaleTab: previewCubit.setScale,
          onFrameTab: previewCubit.setFrame,
          onTypeOfPreview: (type) => _onThemePreviewScreen(type, context),
          isEnableFrame: state.frameVisible,
        ),
        body: child,
      );
    });
  }

  void _onThemePreviewScreen(ThemePreviewScreen themePreviewScreen, BuildContext context) {
    switch (themePreviewScreen) {
      case ThemePreviewScreen.layouts:
        GoRouter.of(context).pushNamed('theme_scheme_review');
        return;
      case ThemePreviewScreen.assets:
        GoRouter.of(context).pushNamed('theme_scheme_review_preview');
        return;
    }
  }
}
