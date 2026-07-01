import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../../features.dart';

class PageThemePreview extends StatelessWidget {
  const PageThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewThemeCubit, PreviewThemeState>(
      builder: (BuildContext context, PreviewThemeState state) {
        return PreviewLayoutView(
          frameVisibility: state.frameVisible,
          mode: state.mode,
          dartDefineOverrides: state.dartDefineOverrides,
        );
      },
    );
  }
}
