import 'dart:convert';

import 'package:flutter/material.dart';

class JsonEditorPanel extends StatefulWidget {
  const JsonEditorPanel({
    required this.initialJson,
    required this.onApply,
    super.key,
  });

  final Map<String, dynamic> initialJson;
  final ValueChanged<Map<String, dynamic>> onApply;

  @override
  State<JsonEditorPanel> createState() => _JsonEditorPanelState();
}

class _JsonEditorPanelState extends State<JsonEditorPanel> {
  late final TextEditingController _controller;
  String? _errorText;
  bool _isValid = true;
  bool _isDirty = false;

  static const _encoder = JsonEncoder.withIndent('  ');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _encode(widget.initialJson));
  }

  @override
  void didUpdateWidget(covariant JsonEditorPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isDirty) {
      final newText = _encode(widget.initialJson);
      if (_controller.text != newText) {
        _controller.text = newText;
        _validate(newText);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _encode(Map<String, dynamic> json) => _encoder.convert(json);

  void _validate(String text) {
    try {
      final decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) {
        setState(() {
          _errorText = null;
          _isValid = true;
        });
      } else {
        setState(() {
          _errorText =
              'Expected a JSON object (Map), got ${decoded.runtimeType}';
          _isValid = false;
        });
      }
    } on FormatException catch (e) {
      setState(() {
        _errorText = 'Invalid JSON: ${e.message}';
        _isValid = false;
      });
    }
  }

  void _onChanged(String text) {
    _isDirty = true;
    _validate(text);
  }

  void _onApply() {
    final decoded = jsonDecode(_controller.text);
    if (decoded is Map<String, dynamic>) {
      widget.onApply(decoded);
      _isDirty = false;
    }
  }

  void _onPrettify() {
    final decoded = jsonDecode(_controller.text);
    final pretty = _encoder.convert(decoded);
    _controller.text = pretty;
    _validate(pretty);
  }

  void _onReset() {
    final text = _encode(widget.initialJson);
    _controller.text = text;
    _isDirty = false;
    _validate(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              controller: _controller,
              onChanged: _onChanged,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(12),
                errorText: _errorText,
                errorMaxLines: 3,
                suffixIcon: _isValid && _isDirty
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: _isValid ? _onPrettify : null,
                icon: const Icon(Icons.auto_fix_high),
                tooltip: 'Prettify',
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: _isDirty ? _onReset : null,
                child: const Text('Reset'),
              ),
              const SizedBox(width: 12),
              FilledButton(
                onPressed: _isValid && _isDirty ? _onApply : null,
                child: const Text('Apply'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
