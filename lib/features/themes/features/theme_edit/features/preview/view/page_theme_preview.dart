import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../../../../../models/theme_preview_screen.dart';
import '../../../../../widgets/menu_preview.dart';
import '../features/features.dart';


class PageThemePreview extends StatelessWidget {
  const PageThemePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final previewCubit = context.read<PreviewThemeCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateThemCubit, UpdateThemeState>(
          listener: (BuildContext context, UpdateThemeState state) => previewCubit.setTheme(state.toThemeSettings()),
        ),
      ],
      child:
          BlocBuilder<PreviewThemeCubit, PreviewThemeState>(builder: (BuildContext context, PreviewThemeState state) {
        if (state.theme == null) {
          // Show loading indicator when the theme is not yet available
          return const Center(child: CircularProgressIndicator());
        }
        // Provide current configured theme for all phone widgets and layouts
        return Scaffold(
            appBar: MenuPreviewToolbar(
              onScaleTab: previewCubit.setScale,
              onFrameTab: previewCubit.setFrame,
              onTypeOfPreview: previewCubit.setPreviewScreen,
              isEnableFrame: state.frameVisible,
            ),
            body: Builder(builder: (context) {
              switch (state.preview) {
                case ThemePreviewScreen.layouts:
                  return PhoneContext(
                    child: PreviewLayoutView(
                      previewType: state.previewType,
                      frameVisibility: state.frameVisible,
                    ),
                  );
                case ThemePreviewScreen.assets:
                  return const AssetsPreview();
              }
            }));
      }),
    );
  }
}
