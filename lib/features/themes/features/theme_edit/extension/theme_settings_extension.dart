import 'package:webtrit_configurator/exports/exports.dart';

import '../models/models.dart';

extension ThemeSettingsX on ThemeSettings {
  List<SchemeColor> get lightSchemeColors {
    final json = lightColorSchemeConfig.toJson();
    final colorsMap =
        (json['colorSchemeOverride'] as Map?)?.cast<String, dynamic>() ??
        json.cast<String, dynamic>();

    return colorsMap.entries
        .map(
          (e) => SchemeColor(
            schemeKey: e.key,
            color: (e.value is String) ? (e.value as String).toColor() : null,
          ),
        )
        .toList();
  }

  List<SchemeColor> get darkSchemeColors {
    final json = darkColorSchemeConfig.toJson();

    final colorsMap =
        (json['colorSchemeOverride'] as Map?)?.cast<String, dynamic>() ??
        json.cast<String, dynamic>();

    return colorsMap.entries
        .map(
          (e) => SchemeColor(
            schemeKey: e.key,
            color: (e.value is String) ? (e.value as String).toColor() : null,
          ),
        )
        .toList();
  }
}
