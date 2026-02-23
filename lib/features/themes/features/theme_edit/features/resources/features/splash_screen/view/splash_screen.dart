import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/mixin/mixin_messages.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

import '../../../widgets/universal_asset_designer.dart';
import '../bloc/splash_assets_bloc.dart';
import '../constants/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with MixinMessages {
  SplashAssetsBloc get _bloc => context.read<SplashAssetsBloc>();
  final controller = ConfigurableAssetDesignerController();

  @override
  void initState() {
    super.initState();

    controller.onPickColor = (req) async {
      final initial = req.currentHex?.tryParseColor();
      final picked = await context.showColorPicker(currentColor: initial);
      return picked?.toHex();
    };

    _bloc.load();
  }

  void _onSnapshotChanged(DesignerSnapshot snap, SplashAssetsState state) {
    final eff = snap.pages.firstWhere(
      (e) => e.pageId == DesignerPageIds.splash,
      orElse: () => snap.pages.first,
    );

    if (eff.paddingDp != state.padding) {
      _bloc.selectPadding(eff.paddingDp);
    }

    final hex = eff.backgroundHex;
    if (hex != state.backgroundColorHex) {
      _bloc.selectBackgroundColor(hex?.tryParseColor());
    }

    final android12Eff = snap.pages.cast<DesignerPageEffective?>().firstWhere(
      (e) => e!.pageId == DesignerPageIds.android12Splash,
      orElse: () => null,
    );
    if (android12Eff != null && android12Eff.paddingDp != state.android12Padding) {
      _bloc.selectAndroid12Padding(android12Eff.paddingDp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashAssetsBloc, SplashAssetsState>(
      listener: (context, state) {
        if (state.status == SplashAssetsStatus.failure) {
          context.showErrorSnackBar(state.error?.toString() ?? 'Failed');
        }
        if (state.status == SplashAssetsStatus.success) {
          context.showSnackBar('Saved');
        }
      },
      builder: (context, state) {
        final defaults = state.constraintsDefaults;
        final slice = (defaults != null)
            ? defaults.withBackground
            : defaultConstraintsModel;
        final android12Slice = defaults?.android12 ?? defaultAndroid12ConstraintsModel;
        final pages = <DesignerPageConfig>[
          DesignerPageConfig(
            id: DesignerPageIds.splash,
            label: 'Splash',
            isCommon: true,
            previewOnlyColor: true,
            sizeDp: slice.fullSizeDp,
            safeZoneDp: slice.maskDiameterDp,
            maskDp: slice.maskDiameterDp,
            exportSizePx: (slice.fullSizeDp * 2).round(),
            paddingDp: state.padding,
            initialBackgroundHex: state.backgroundColorHex,
            bgInheritsFromCommon: false,
          ),
          DesignerPageConfig(
            id: DesignerPageIds.android12Splash,
            label: 'Android 12',
            previewOnlyColor: true,
            sizeDp: android12Slice.fullSizeDp,
            safeZoneDp: android12Slice.maskDiameterDp,
            maskDp: android12Slice.fullSizeDp * 2 / 3, // actual circular mask (192dp)
            exportSizePx: (android12Slice.fullSizeDp * 4).round(),
            paddingDp: state.android12Padding,
            initialBackgroundHex: state.backgroundColorHex,
          ),
        ];

        final designerKey = ValueKey(state.updatedAt ?? 'init');

        return Scaffold(
          appBar: AppBar(
            title: const Text('Splash Screen'),
            actions: [
              IconButton(
                tooltip: 'Clean splash screen (no image).',
                onPressed: () => _bloc.delete(),
                icon: const Icon(Icons.delete_outlined),
              ),
              IconButton(
                tooltip: 'Choose an image (SVG/PNG).',
                onPressed: () => _pickAsset(state.assets),
                icon: const Icon(Icons.file_open),
              ),
              IconButton(
                tooltip: 'Save',
                onPressed: state.isLoading ? null : _save,
                icon: state.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 1),
                      )
                    : const Icon(Icons.save),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              child: ConfigurableAssetDesigner(
                pages: pages,
                key: designerKey,
                controller: controller,
                foregroundAsset: state.selectedAsset,
                onSnapshotChanged: (snap) => _onSnapshotChanged(snap, state),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _save() async {
    await _bloc.startRender();
    final files = await controller.exportAll();
    await _bloc.saveWithExports(
      files[DesignerPageIds.splash]!,
      files[DesignerPageIds.android12Splash],
    );
  }

  Future<void> _pickAsset(List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (picked != null) _bloc.selectAsset(picked);
  }
}
