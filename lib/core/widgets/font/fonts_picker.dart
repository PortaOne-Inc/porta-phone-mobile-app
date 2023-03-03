import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:webtrit_configurator/core/assets/assets.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/share/entity/entity.dart';

import 'fonts.dart';

class FontsPicker extends StatefulWidget {
  const FontsPicker({
    super.key,
    required this.onChoose,
    required this.onClose,
  });

  final Function(String name) onChoose;
  final Function() onClose;

  @override
  State<FontsPicker> createState() => _FontsPickerState();
}

class _FontsPickerState extends State<FontsPicker> {
  final _allGoogleStyles = <GoogleStyle>[];
  final _filteredGoogleStyles = <GoogleStyle>[];

  final _renderedItemsStyleCount = 10;

  @override
  void initState() {
    _initStyles();
    super.initState();
  }

  void _initStyles() {
    GoogleFonts.asMap().forEach((key, value) {
      _allGoogleStyles.add(GoogleStyle(key, value));
    });
    _filteredGoogleStyles.addAll(_allGoogleStyles);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 0,
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(left: 24),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      onTap: () => widget.onClose(),
                    )),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 24),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Font name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                        ),
                        onChanged: (v) async {
                          final filteredList = _allGoogleStyles.where((element) => element.name.contains(v)).toList();
                          _filteredGoogleStyles.clear();
                          _filteredGoogleStyles.addAll(filteredList);
                          setState(() {});
                        },
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredGoogleStyles.length,
              itemBuilder: (ctx, i) {
                final font = _filteredGoogleStyles[i];
                return InkWell(
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            font.name,
                            key: ValueKey(font.style),
                            style: _prepareStyleForText(font),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.tryParse("https://fonts.google.com/specimen/${font.name}");
                              if (url != null) {
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'error launching $url';
                                }
                              }
                            },
                            child: Text(
                              context.l10n.feature_theme_edit_FontPicker_font_details,
                              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => widget.onChoose(font.name),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  TextStyle? _prepareStyleForText(GoogleStyle fontStyle) {
    final style = fontStyle.style();
    return _filteredGoogleStyles.length < _renderedItemsStyleCount ? style : null;
  }
}
