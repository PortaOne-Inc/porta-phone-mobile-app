import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class ThemeShellRoute extends StatelessWidget {
  const ThemeShellRoute({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        final theme = state.toThemeSettings();
        return ThemeProvider(
          settings: theme,
          lightDynamic: null,
          darkDynamic: null,
          child: child,
        );
      },
    );
  }
}
