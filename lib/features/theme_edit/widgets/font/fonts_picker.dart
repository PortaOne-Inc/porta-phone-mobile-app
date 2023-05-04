import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:webtrit_configurator/core/assets/assets.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';

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
  final _fonts = <String>[];
  final _filteredFonts = <String>[];

  late int _pageSize;

  final PagingController<int, String> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _fonts.addAll(GoogleFonts.asMap().keys.toList());
    _filteredFonts.addAll(_fonts);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageSize = 5;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final loadedItems = _pagingController.value.itemList?.length ?? 0;
      final newItems = _filteredFonts.sublist(loadedItems, loadedItems + _pageSize).toList();

      // Time for render font items
      if (loadedItems > 24) await Future.delayed(const Duration(seconds: 1));

      if (newItems.length < _pageSize) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
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
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Font name',
                  prefixIcon: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 16, right: 8),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    onTap: () => widget.onClose(),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
                onChanged: (v) async {
                  final filteredList = _fonts.where((element) => element.contains(v)).toList();
                  _filteredFonts.clear();
                  _filteredFonts.addAll(filteredList);
                  _pagingController.refresh();
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: PagedListView<int, String>(
              pagingController: _pagingController,
              cacheExtent: 20,
              builderDelegate: PagedChildBuilderDelegate<String>(
                itemBuilder: (context, item, index) => InkWell(
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item,
                            style: GoogleFonts.getFont(item),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.tryParse(ConstsUrl.font(item));
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => widget.onChoose(item),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
