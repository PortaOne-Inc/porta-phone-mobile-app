import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../../features.dart';

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
          listener: (BuildContext context, UpdateThemeState state) => previewCubit.setTheme(
            state.toThemeSettings(),
          ),
        ),
      ],
      child: BlocBuilder<PreviewThemeCubit, PreviewThemeState>(builder: (
        BuildContext context,
        PreviewThemeState state,
      ) {
        if (state.theme == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return PreviewLayoutView(
          previewType: state.previewType,
          frameVisibility: state.frameVisible,
        );
      }),
    );
  }
}
