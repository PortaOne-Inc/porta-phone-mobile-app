import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

// ignore: unused_import
import 'package:webtrit_configurator/features/themes/models/models.dart';

import 'theme_assents_preview.dart';

class AssetsPreview extends StatefulWidget {
  const AssetsPreview({
    super.key,
  });

  @override
  State<AssetsPreview> createState() => _AssetsPreviewState();
}

class _AssetsPreviewState extends State<AssetsPreview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(builder: (BuildContext context, state) {
      return ThemeAssetsPreview(
        theme: state.theme!,
      );
    });
  }
}
