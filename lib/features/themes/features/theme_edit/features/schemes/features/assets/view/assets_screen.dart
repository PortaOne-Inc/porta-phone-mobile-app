import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:domain/domain.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import '../bloc/assets_cubit.dart';
import '../widgets/widgets.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({
    super.key,
  });

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  final Set<ThemeAssetType> selectedFilterTypes = {};

  @override
  void initState() {
    final filters = context.read<AssetsCubit>().state.filters;
    selectedFilterTypes.addAll(filters);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final lockFilters = context.read<AssetsCubit>().state.lockFilters;

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        final filteredAssets = selectedFilterTypes.isNotEmpty
            ? state.assets.where((asset) => _applyFilters(asset, selectedFilterTypes)).toList()
            : state.assets;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Assets',
              style: textTheme.titleSmall,
            ),
            actions: [
              if (!lockFilters)
                PopupMenuButton<ThemeAssetType>(
                  icon: Icon(
                    Icons.filter_list,
                    color: colorScheme.primary,
                  ),
                  onSelected: (filter) {
                    setState(() {
                      if (selectedFilterTypes.contains(filter)) {
                        selectedFilterTypes.remove(filter);
                      } else {
                        selectedFilterTypes.add(filter);
                      }
                    });
                  },
                  itemBuilder: (context) => ThemeAssetType.values.map((filter) {
                    return CheckedPopupMenuItem<ThemeAssetType>(
                      value: filter,
                      checked: selectedFilterTypes.contains(filter),
                      child: Text(filter.name, style: textTheme.bodyMedium),
                    );
                  }).toList(),
                ),
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
                children: filteredAssets
                    .map((file) => AssetCard(
                          asset: file,
                          onTap: () => _onReturnFile(file),
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _applyFilters(ThemeAssetModel asset, Set<ThemeAssetType> filterTypes) {
    // Implement logic to check if the asset matches any of the selected filter types
    return filterTypes.contains(asset.inferredType);
  }

  Future<void> _onReturnFile(ThemeAssetModel asset) async {
    GoRouter.of(context).pop(asset);
  }

  Future<void> _onAddAsset(List<ThemeAssetModel> assets) async {
    final asset = await GoRouter.of(context).pushNamed<ThemeAssetModel>(SchemeRoute.assetsSchemeAddAsset.name);
    if (asset != null && mounted) {
      context.read<UpdateThemCubit>().add(UpdateSchemeEvent.assets([...assets, asset]));
    }
  }
}
