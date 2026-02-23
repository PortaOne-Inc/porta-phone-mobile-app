import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../features/themes/features/theme_edit/consts/font_const.dart';
import 'common/common.dart';

class FontsPicker extends StatefulWidget {
  const FontsPicker({required this.onChoose, required this.onClose, super.key});

  final void Function(String name) onChoose;
  final VoidCallback onClose;

  @override
  State<FontsPicker> createState() => _FontsPickerState();
}

class _FontsPickerState extends State<FontsPicker> {
  final _fonts = <String>[];
  final _filteredFonts = <String>[];
  final TextEditingController _textEditingController = TextEditingController();

  static const int _pageSize = 20;

  late final PagingController<int, String> _pagingController = PagingController(
    getNextPageKey: (state) {
      if (state.keys == null || state.keys!.isEmpty) return 0;
      if ((state.pages?.last.length ?? 0) < _pageSize) return null;
      return state.items?.length ?? 0;
    },
    fetchPage: (pageKey) async {
      if (pageKey > 24)
        await Future<void>.delayed(const Duration(milliseconds: 500));

      final startIndex = pageKey;

      if (startIndex >= _filteredFonts.length) return [];

      final endIndex = startIndex + _pageSize;
      final effectiveEndIndex = endIndex > _filteredFonts.length
          ? _filteredFonts.length
          : endIndex;

      return _filteredFonts.sublist(startIndex, effectiveEndIndex);
    },
  );

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

    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FontSearchHeader(
              controller: _textEditingController,
              onClose: widget.onClose,
            ),
            Expanded(
              child: PagingListener<int, String>(
                controller: _pagingController,
                builder: (context, state, fetchNextPage) {
                  return PagedListView<int, String>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    cacheExtent: 500,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    builderDelegate: PagedChildBuilderDelegate<String>(
                      animateTransitions: true,
                      itemBuilder: (context, item, index) => _FontCardItem(
                        fontName: item,
                        onTap: () => widget.onChoose(item),
                      ),
                      firstPageErrorIndicatorBuilder: (_) =>
                          const ErrorPlaceholder(
                            message: 'Error loading fonts',
                          ),
                      noItemsFoundIndicatorBuilder: (_) =>
                          const NoDataPlaceholder(
                            message: 'No fonts found',
                            icon: Icons.text_fields,
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FontSearchHeader extends StatelessWidget {
  const _FontSearchHeader({required this.controller, required this.onClose});

  final TextEditingController controller;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search fonts...',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    if (controller.text.isEmpty) return const SizedBox.shrink();
                    return IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onPressed: controller.clear,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FontCardItem extends StatelessWidget {
  const _FontCardItem({required this.fontName, required this.onTap});

  final String fontName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fontName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 0.5,
                    ),
                  ),
                  InkWell(
                    onTap: () => FontConst.font(fontName).launchAsUrl(),
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.info_outline, size: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.getFont(
                  fontName,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
