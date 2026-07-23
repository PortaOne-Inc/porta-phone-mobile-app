import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';

import '../../../../../widgets/menu_preview.dart';
import '../features/layouts_preview/bloc/preview_theme_cubit.dart';
import '../features/layouts_preview/view/dart_define_override_screen.dart';

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
            mode: state.mode,
            onModeChanged: previewCubit.setMode,
            onOverrideDartDefine: state.mode.isRealtime ? () => _openOverride(context, previewCubit) : null,
          ),
          body: child,
        );
      },
    );
  }

  Future<void> _openOverride(BuildContext context, PreviewThemeCubit previewCubit) async {
    final applicationId = context.read<UpdateThemCubit>().applicationId;
    final environmentUsecase = context.read<GetApplicationEnvironmentUsecase>();
    final overrides = await Navigator.of(context).push<Map<String, String>>(
      MaterialPageRoute(
        builder: (_) => DartDefineOverrideScreen(
          applicationId: applicationId,
          environmentUsecase: environmentUsecase,
          initialOverrides: previewCubit.state.dartDefineOverrides,
        ),
      ),
    );
    if (overrides != null) {
      previewCubit.setDartDefineOverrides(overrides);
    }
  }
}
