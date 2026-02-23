// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class TranslationItem extends StatefulWidget {
  const TranslationItem({
    required this.originalTranslation,
    required this.overrideTranslation,
    required this.onChange,
    required this.onRestore,
    super.key,
  });

  final Translation originalTranslation;
  final Translation? overrideTranslation;

  final ValueChanged<String>? onChange;
  final VoidCallback? onRestore;

  @override
  _TranslationItemState createState() => _TranslationItemState();
}

class _TranslationItemState extends State<TranslationItem> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  late Debouncer _debouncer;
  late String _previousText;

  final _border = const OutlineInputBorder(borderSide: BorderSide(width: 0.1));

  @override
  void initState() {
    super.initState();
    _previousText =
        widget.overrideTranslation?.value ?? widget.originalTranslation.value;
    _controller = TextEditingController(text: _previousText);
    _debouncer = Debouncer(milliseconds: 500);
    _controller.addListener(_onTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: _focusNode.requestFocus,
      child: Focus(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 64, bottom: 4),
            child: GestureDetector(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  widget.originalTranslation.key,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: .25),
                  ),
                ),
              ),
              onTap: () => Clipboard.setData(
                ClipboardData(text: widget.originalTranslation.key),
              ),
            ),
          ),
          subtitle: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withValues(alpha: 0.25),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Center(child: Text(widget.originalTranslation.locale)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: context
                        .l10n
                        .feature_translation_TranslationItem_hint_text,
                    enabledBorder: _border,
                    focusedBorder: _border,
                    disabledBorder: _border,
                  ),
                ),
              ),
              IconButton(
                splashRadius: 24,
                tooltip: context
                    .l10n
                    .feature_translation_TranslationItem_tooltip_clear_override,
                icon: const Icon(Icons.restore),
                onPressed: _isRestoreDisabled ? null : _handleRestore,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get _isRestoreDisabled {
    return widget.originalTranslation.value ==
            widget.overrideTranslation?.value ||
        widget.overrideTranslation?.value == null;
  }

  void _onTextChanged() {
    if (_focusNode.hasFocus) {
      _debouncer.run(() {
        if (_controller.text != _previousText) {
          _previousText = _controller.text;
          widget.onChange?.call(_controller.text);
        }
      });
    }
  }

  void _handleRestore() {
    setState(() {
      _controller.text = widget.originalTranslation.value;
      _previousText = widget.originalTranslation.value;
      widget.onRestore?.call();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }
}
