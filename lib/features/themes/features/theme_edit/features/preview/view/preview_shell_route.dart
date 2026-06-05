import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/menu_preview.dart';
import '../features/layouts_preview/bloc/preview_theme_cubit.dart';

class PreviewShellRoute extends StatelessWidget {
  const PreviewShellRoute({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final previewCubit = context.watch<PreviewThemeCubit>();

    return BlocBuilder<PreviewThemeCubit, PreviewThemeState>(
      builder: (BuildContext context, PreviewThemeState state) {
        return Scaffold(
          appBar: MenuPreviewToolbar(
            onFrameTab: previewCubit.setFrame,
            isEnableFrame: state.frameVisible,
            onInteractiveTab: previewCubit.setInteractive,
            isInteractive: state.interactive,
          ),
          body: child,
        );
      },
    );
  }
}
