import 'dart:async';

import 'package:collection/collection.dart';

import 'package:webtrit_configurator/exports/exports.dart';

abstract class ColorSchemeEditorApi {
  ColorSchemeConfig get initial;

  ColorSchemeConfig? get initialOrNull;

  ColorSchemeConfig get current;

  void setInitial(ColorSchemeConfig initial);

  void resetToInitial();

  void resetTo(ColorSchemeConfig model, {bool setAsInitial = false});

  ColorSchemeConfig buildFull();

  void setColorSchemeConfig(ColorSchemeConfig cfg);

  void replaceOverride(Map<String, dynamic> overrideFull);

  void patchOverride(Map<String, dynamic> partial);
}

class ColorSchemeEditor implements ColorSchemeEditorApi {
  ColorSchemeEditor({ColorSchemeConfig? initial}) {
    if (initial != null) setInitial(initial);
  }

  final DeepCollectionEquality _eq = const DeepCollectionEquality();
  ColorSchemeConfig? _initial;
  ColorSchemeConfig? _current;

  final _controller = StreamController<ColorSchemeConfig>.broadcast();

  Stream<ColorSchemeConfig> get stream => _controller.stream;

  bool get isDirty {
    final i = _initial;
    final c = _current;
    if (i == null || c == null) return false;
    return !_eq.equals(i.toJson(), c.toJson());
  }

  void _emit() {
    final c = _current;
    if (c != null && !_controller.isClosed) _controller.add(c);
  }

  @override
  ColorSchemeConfig get initial {
    final i = _initial;
    if (i == null) {
      throw StateError(
        'ColorSchemeEditor not initialized. Call setInitial() first.',
      );
    }
    return i;
  }

  @override
  ColorSchemeConfig? get initialOrNull => _initial;

  @override
  ColorSchemeConfig get current {
    final c = _current;
    if (c == null) {
      throw StateError(
        'ColorSchemeEditor not initialized. Call setInitial() first.',
      );
    }
    return c;
  }

  @override
  void setInitial(ColorSchemeConfig initial) {
    _initial = initial;
    _current = initial;
    _emit();
  }

  @override
  void resetToInitial() {
    _current = _initial;
    _emit();
  }

  @override
  void resetTo(ColorSchemeConfig model, {bool setAsInitial = false}) {
    _current = model;
    if (setAsInitial) _initial = model;
    _emit();
  }

  @override
  ColorSchemeConfig buildFull() => current;

  @override
  void setColorSchemeConfig(ColorSchemeConfig cfg) {
    _current = cfg;
    _emit();
  }

  @override
  void replaceOverride(Map<String, dynamic> overrideFull) {
    final map = Map<String, dynamic>.from(current.toJson());
    map['colorSchemeOverride'] = Map<String, dynamic>.from(overrideFull);
    _current = ColorSchemeConfig.fromJson(map);
    _emit();
  }

  @override
  void patchOverride(Map<String, dynamic> partial) {
    final map = Map<String, dynamic>.from(current.toJson());
    final existing = Map<String, dynamic>.from(
      (map['colorSchemeOverride'] as Map?) ?? const <String, dynamic>{},
    )..addAll(partial);
    map['colorSchemeOverride'] = existing;
    _current = ColorSchemeConfig.fromJson(map);
    _emit();
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
