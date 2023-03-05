import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'used_color.dart';

class SavedThemes extends StatelessWidget {
  const SavedThemes({
    super.key,
    required this.themeMode,
    required this.onTap,
  });

  final ThemeModel themeMode;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        color: Colors.white.withOpacity(0.95),
        elevation: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: themeMode.colors.gradientTabColor.map((e) => Color(e)).toList())),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
                  ),
                  child: Text(themeMode.commonConfig.appName,
                      textAlign: TextAlign.center,
                      style: (_preparedSelectedStyle(themeMode.textStyles.generalFontName) ??
                              Theme.of(context).textTheme.labelLarge)
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
                ),
                Wrap(children: themeMode.colors.asList().map((e) => UsedColor(color: Color(e))).toList())
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle? _preparedSelectedStyle(String? name) {
    return GoogleFonts.asMap().entries.firstWhereOrNull((element) => element.key == name)?.value();
  }
}
