// import 'package:flutter/material.dart';
// import 'package:domain/domain.dart';
//
// import '../../../widgets/universal_asset_designer.dart';
//
// typedef SnapshotChanged = void Function(ConfigurableAssetSnapshot snap);
//
// class DesignerCanvas extends StatelessWidget {
//   const DesignerCanvas({
//     super.key,
//     required this.controller,
//     required this.pages,
//     required this.foregroundAsset,
//     required this.backgroundAsset,
//     required this.onSnapshotChanged,
//   });
//
//   final ConfigurableAssetDesignerController controller;
//   final List<DesignerPageConfig> pages;
//   final AssetModel? foregroundAsset;
//   final AssetModel? backgroundAsset;
//   final SnapshotChanged onSnapshotChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ConfigurableAssetDesigner(
//           controller: controller,
//           pages: pages,
//           foregroundAsset: foregroundAsset,
//           backgroundAsset: backgroundAsset,
//           onSnapshotChanged: onSnapshotChanged,
//         ),
//       ),
//     );
//   }
// }
