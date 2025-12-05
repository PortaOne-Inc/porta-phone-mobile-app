import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import '../consts/font_const.dart';

class FontsPicker extends StatefulWidget {
  const FontsPicker({
    required this.onChoose,
    required this.onClose,
    super.key,
  });

  final void Function(String name) onChoose;
  final void Function() onClose;

  @override
  State<FontsPicker> createState() => _FontsPickerState();
}

class _FontsPickerState extends State<FontsPicker> {
  final _fonts = <String>[];
  final _filteredFonts = <String>[];

  static const int _pageSize = 20; // Increased for smoother scrolling

  // NEW API: Define logic inside the constructor
  late final PagingController<int, String> _pagingController = PagingController(
    // 1. Logic to calculate the next page key (offset)
    getNextPageKey: (state) {
      // If no keys yet, start at 0
      if (state.keys == null || state.keys!.isEmpty) return 0;

      // If the last page was smaller than pageSize, we are done
      if ((state.pages?.last.length ?? 0) < _pageSize) return null;

      // Otherwise, next key is the total number of items loaded so far
      return state.items?.length ?? 0;
    },
    // 2. Logic to fetch data (returns the items directly)
    fetchPage: (pageKey) async {
      // Simulate delay if needed (from your original code)
      if (pageKey > 24) await Future<void>.delayed(const Duration(milliseconds: 500));

      final startIndex = pageKey;

      // If we are out of bounds, return empty list
      if (startIndex >= _filteredFonts.length) return [];

      final endIndex = startIndex + _pageSize;
      final effectiveEndIndex = endIndex > _filteredFonts.length ? _filteredFonts.length : endIndex;

      // Return the sublist directly. The controller handles appending.
      return _filteredFonts.sublist(startIndex, effectiveEndIndex);
    },
  );

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fonts.addAll(GoogleFonts.asMap().keys.toList());
    _filteredFonts.addAll(_fonts);
    _textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final currentText = _textEditingController.text;

    final filteredList = _fonts.where((element) {
      return element.toLowerCase().startsWith(currentText.toLowerCase());
    }).toList();

    _filteredFonts
      ..clear()
      ..addAll(filteredList);

    // Refreshing resets the state and triggers fetchPage(0)
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Font name',
                prefixIcon: InkWell(
                  onTap: widget.onClose,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
          Expanded(
            // NEW API: Wrap PagedListView in PagingListener
            child: PagingListener<int, String>(
              controller: _pagingController,
              builder: (context, state, fetchNextPage) {
                return PagedListView<int, String>(
                  // Pass state and fetchNextPage directly
                  state: state,
                  fetchNextPage: fetchNextPage,
                  cacheExtent: 100, // Improves scroll performance
                  builderDelegate: PagedChildBuilderDelegate<String>(
                    itemBuilder: (context, item, index) => InkWell(
                      onTap: () => widget.onChoose(item),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item,
                                style: GoogleFonts.getFont(item),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final url = Uri.tryParse(FontConst.font(item));
                                  if (url != null && await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Text(
                                  // Use your localization here
                                  context.l10n.feature_theme_edit_FontPicker_font_details,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
