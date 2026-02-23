import 'package:domain/domain.dart';

import '../../../widgets/widgets.dart';
import '../bloc/launch_assets_bloc.dart';
import '../constants/designer_page_ids.dart';

List<DesignerPageConfig> buildDesignerPages({
  required LaunchAssetsState state,
  required ConstraintsModel constraints,
}) {
  final cons = constraints;

  return <DesignerPageConfig>[
    DesignerPageConfig(
      id: DesignerPageIds.common,
      label: 'Common',
      isCommon: true,
      exportEnabled: false,
      sizeDp: cons.androidAdaptive?.sizeDp ?? 432,
      safeZoneDp: cons.androidAdaptive?.safeZoneDp ?? 264,
      exportSizePx: 0,
      paddingDp: state.paddingAndroidAdaptive,
      initialBackgroundHex: state.selectedBackgroundColorHex,
    ),
    DesignerPageConfig(
      id: DesignerPageIds.androidAdaptive,
      label: 'Android (Adaptive)',
      sizeDp: cons.androidAdaptive?.sizeDp ?? 432,
      safeZoneDp: cons.androidAdaptive?.safeZoneDp ?? 264,
      exportSizePx: 432,
      paddingDp: state.paddingAndroidAdaptive,
    ),
    DesignerPageConfig(
      id: DesignerPageIds.androidLegacy,
      label: 'Android (Legacy)',
      sizeDp: cons.androidLegacy?.sizeDp ?? 512,
      safeZoneDp: cons.androidLegacy?.safeZoneDp,
      exportSizePx: 512,
      paddingDp: state.paddingAndroidLegacy,
    ),
    DesignerPageConfig(
      id: DesignerPageIds.ios,
      label: 'iOS',
      sizeDp: cons.ios?.sizeDp ?? 1024,
      safeZoneDp: cons.ios?.safeZoneDp,
      exportSizePx: 1024,
      paddingDp: state.paddingIOS,
    ),
    DesignerPageConfig(
      id: DesignerPageIds.web,
      label: 'Web',
      sizeDp: cons.web?.sizeDp ?? 512,
      safeZoneDp: cons.web?.safeZoneDp,
      exportSizePx: 512,
      paddingDp: state.paddingWEB,
    ),
  ];
}
