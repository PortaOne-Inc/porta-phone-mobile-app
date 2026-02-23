import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountdownField extends StatefulWidget {
  const CountdownField({
    required this.value,
    required this.onChanged,
    super.key,
    this.min = 0,
    this.max = 120,
    this.label = 'Countdown (seconds)',
    this.tooltip =
        '0 disables countdown — the "Repeat" button is available immediately.',
    this.debounce = const Duration(milliseconds: 150),
    this.onCommitted,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final String label;
  final String tooltip;
  final Duration debounce;
  final ValueChanged<int>? onCommitted;

  @override
  State<CountdownField> createState() => _CountdownFieldState();
}

class _CountdownFieldState extends State<CountdownField> {
  late int _local;
  final _controller = TextEditingController();
  Timer? _debounce;
  bool _isSliding = false;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _local = _clamp(widget.value);
    _controller.text = _local.toString();
  }

  @override
  void didUpdateWidget(covariant CountdownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isSliding && !_isTyping && oldWidget.value != widget.value) {
      final v = _clamp(widget.value);
      if (v != _local) {
        _local = v;
        _controller.text = _local.toString();
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  int _clamp(int v) => v.clamp(widget.min, widget.max);

  void _emitDebounced(int v) {
    _debounce?.cancel();
    _debounce = Timer(widget.debounce, () => widget.onChanged(v));
  }

  void _commit(int v) {
    _debounce?.cancel();
    widget.onChanged(v);
    widget.onCommitted?.call(v);
  }

  @override
  Widget build(BuildContext context) {
    final clamped = _clamp(_local);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.label),
            const SizedBox(width: 8),
            Tooltip(
              message: widget.tooltip,
              child: const Icon(Icons.info_outline, size: 18),
            ),
            const Spacer(),
            Text(
              clamped.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Slider(
          value: clamped.toDouble(),
          min: widget.min.toDouble(),
          max: widget.max.toDouble(),
          divisions: widget.max - widget.min,
          label: '$clamped s',
          onChangeStart: (_) {
            _isSliding = true;
          },
          onChanged: (v) {
            final iv = _clamp(v.round());
            if (iv != _local) {
              setState(() => _local = iv);
              _controller.text = iv.toString();
              _emitDebounced(iv);
            }
          },
          onChangeEnd: (v) {
            _isSliding = false;
            final iv = _clamp(v.round());
            _commit(iv);
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 120,
            child: Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus && _isTyping) {
                  _isTyping = false;
                  final iv = _clamp(int.tryParse(_controller.text) ?? _local);
                  if (iv != _local) {
                    setState(() => _local = iv);
                  }
                  _commit(iv);
                }
              },
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Seconds',
                  isDense: true,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                onTap: () => _isTyping = true,
                onChanged: (txt) {
                  _isTyping = true;
                  final parsed = int.tryParse(txt);
                  if (parsed != null) {
                    final iv = _clamp(parsed);
                    if (iv != _local) {
                      setState(() => _local = iv);
                      _emitDebounced(iv);
                    }
                  }
                },
                onFieldSubmitted: (txt) {
                  _isTyping = false;
                  final iv = _clamp(int.tryParse(txt) ?? _local);
                  if (iv != _local) setState(() => _local = iv);
                  _commit(iv);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
