import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/extensions/extensions.dart';

import '../../../widgets/widgets.dart';
import '../bloc/launch_assets_bloc.dart';
import '../constants/consts.dart';
import '../widgets/widgets.dart';

class LaunchAssetsScreen extends StatefulWidget {
  const LaunchAssetsScreen({super.key});

  @override
  State<LaunchAssetsScreen> createState() => _LaunchAssetsScreenState();
}

class _LaunchAssetsScreenState extends State<LaunchAssetsScreen> {
  LaunchAssetsCubit get _cubit => context.read<LaunchAssetsCubit>();
  final controller = ConfigurableAssetDesignerController();

  @override
  void initState() {
    super.initState();

    controller.onPickColor = (req) async {
      final initial = req.currentHex?.tryParseColor();
      final picked = await context.showColorPicker(currentColor: initial);
      return picked?.toHex();
    };

    _cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchAssetsCubit, LaunchAssetsState>(
      builder: (context, state) {
        final saving = state.saving;

        final cons = state.constraints ?? defaultConstraintsModel;

        final designerKey = ValueKey(
          state.envelope?.entity.updatedAt.toIso8601String() ?? 'init',
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Launcher Icons'),
            actions: [
              LaunchAssetsAppBarActions(
                saving: saving,
                onDelete: _cubit.delete,
                onPickForeground: () => _onPickForegroundColor(state.assets),
                onPickBackground: () => _onPickBackgroundColor(state.assets),
                onSave: _onSave,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ConfigurableAssetDesigner(
                  key: designerKey,
                  controller: controller,
                  pages: buildDesignerPages(state: state, constraints: cons),
                  foregroundAsset: state.selectedForegroundAsset,
                  backgroundAsset: state.selectedBackgroundAsset,
                  onSnapshotChanged: _onDesignerSnapshot,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onDesignerSnapshot(DesignerSnapshot snapshot) async {
    _cubit.selectBackgroundColor(snapshot.commonBackgroundHex?.tryParseColor());

    double? padAndroidAdaptive;
    double? padAndroidLegacy;
    double? padIOS;
    double? padWeb;

    for (final p in snapshot.pages) {
      switch (p.pageId) {
        case DesignerPageIds.androidAdaptive:
          padAndroidAdaptive = p.paddingDp;
        case DesignerPageIds.androidLegacy:
          padAndroidLegacy = p.paddingDp;
        case DesignerPageIds.ios:
          padIOS = p.paddingDp;
        case DesignerPageIds.web:
          padWeb = p.paddingDp;
      }
    }

    _cubit.setPadding(
      paddingAndroidAdaptive: padAndroidAdaptive,
      paddingAndroidLegacy: padAndroidLegacy,
      paddingIOS: padIOS,
      paddingWEB: padWeb,
    );
  }

  Future<void> _onSave() async {
    await _cubit.startRender();

    final files = await controller.exportAll();

    await _cubit.saveWithExports(
      files[DesignerPageIds.androidAdaptive]!,
      files[DesignerPageIds.androidLegacy]!,
      files[DesignerPageIds.ios]!,
      files[DesignerPageIds.web]!,
    );
  }

  Future<void> _onPickBackgroundColor(List<AssetModel> assets) async {
    final a = await context.pickAsset(assets);
    if (a != null) _cubit.selectBackgroundAsset(a);
  }

  Future<void> _onPickForegroundColor(List<AssetModel> assets) async {
    final a = await context.pickAsset(assets);
    if (a != null) _cubit.selectForegroundAsset(a);
  }
}
