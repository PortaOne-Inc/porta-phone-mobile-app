import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../widgets/widgets.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({
    super.key,
  });

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Assets',
              style: textTheme.titleSmall,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: colorScheme.primary,
                ),
                onPressed: () => _onAddAsset(state.assets),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.assets.map((file) => AssetCard(asset: file)).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onAddAsset(List<ThemeAssetModel> assets) async {
    final asset = await GoRouter.of(context).pushNamed<ThemeAssetModel>(SchemeRoute.assetsSchemeAddAsset.name);
    if (asset != null && mounted) {
      context.read<UpdateThemCubit>().add(UpdateSchemeEvent.assets([...assets, asset]));
    }
  }
}
