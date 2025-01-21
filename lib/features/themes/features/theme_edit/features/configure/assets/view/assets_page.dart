import 'package:domain/entity/models/theme/theme_asset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_phone/theme/theme_provider.dart';

import 'assets_view.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Asssetd',
              style: textTheme.titleMedium,
            ),
          ),
          body: AssetsView(
            assets: state.assets,
            onUpdate: (List<ThemeAssetModel> value) =>
                context.read<UpdateThemCubit>().add(UpdateSchemeEvent.assets(value)),
          ),
        );
      },
    );
  }
}
