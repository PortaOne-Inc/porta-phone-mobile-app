// Generates the generator base from pure DTO defaults — the schema source of
// truth (webtrit_appearance_theme). Nothing is read from or written to the
// client app; the base is the DTOs' own `toJson()` of default instances. The
// backend composer authors all design (colors, gradients, tabs, features).
//
// Run:  cd tool/base-theme && dart pub get && dart run bin/gen.dart
import 'dart:convert';
import 'dart:io';

import 'package:webtrit_appearance_theme/webtrit_appearance_theme.dart';

void main() {
  const enc = JsonEncoder.withIndent('  ');
  const base = '../../src/features/themes/features/generate/base';
  final files = <String, Map<String, dynamic>>{
    'color.light.json': const ColorSchemeConfig().toJson(),
    'color.dark.json': const ColorSchemeConfig().toJson(),
    'widget.light.json': const ThemeWidgetConfig().toJson(),
    'widget.dark.json': const ThemeWidgetConfig().toJson(),
    'page.light.json': const ThemePageConfig().toJson(),
    'page.dark.json': const ThemePageConfig().toJson(),
    'app.config.json': const AppConfig().toJson(),
  };
  for (final e in files.entries) {
    File('$base/${e.key}').writeAsStringSync('${enc.convert(e.value)}\n');
    stdout.writeln('wrote ${e.key} (${enc.convert(e.value).length} bytes)');
  }
}
