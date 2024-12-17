import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../app/theme/theme.dart';
import '../gen/assets.gen.dart';

class AppThemes {
  AppThemes._({
    required this.settings,
  });

  final ThemeSettings settings;

  static Future<AppThemes> init() async {
    final themeJson = await _getJson(Assets.themes.original) as Map<String, dynamic>;
    final settings = ThemeSettings.fromJson(themeJson);

    try {
      if (settings.fontFamily != null) {
        await GoogleFonts.pendingFonts([
          GoogleFonts.getFont(settings.fontFamily!),
        ]);
      }
    } catch (e) {
      print('Failed to preload Google Fonts: $e');
    }

    return AppThemes._(settings: settings);
  }

  static Future<dynamic> _getJson(String path) async {
    return jsonDecode(await rootBundle.loadString(path));
  }
}
