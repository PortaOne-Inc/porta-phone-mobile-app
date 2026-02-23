import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class TabBarConfigEditor extends StatelessWidget {
  const TabBarConfigEditor({
    required this.value,
    required this.onChanged,
    this.description,
    super.key,
  });

  final TabBarConfig value;
  final ValueChanged<TabBarConfig> onChanged;
  final Widget? description;

  void _update(TabBarConfig newValue) => onChanged(newValue);

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onApply,
  ) async {
    final newColor = await context.showColorPicker(currentColor: current);
    if (newColor != null) {
      onApply(newColor.toHex(includeAlpha: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[description!, const SizedBox(height: 16)],
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Colors', style: theme.textTheme.titleSmall),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ColorField(
                      title: 'Indicator Fill',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.indicatorColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.indicatorColor?.toColor(),
                        (hex) => _update(value.copyWith(indicatorColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Divider',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.dividerColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.dividerColor?.toColor(),
                        (hex) => _update(value.copyWith(dividerColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Selected Label',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.labelColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.labelColor?.toColor(),
                        (hex) => _update(value.copyWith(labelColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Unselected Label',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.unselectedLabelColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.unselectedLabelColor?.toColor(),
                        (hex) =>
                            _update(value.copyWith(unselectedLabelColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Overlay / Splash',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.overlayColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.overlayColor?.toColor(),
                        (hex) => _update(value.copyWith(overlayColor: hex)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Layout & Behavior', style: theme.textTheme.titleSmall),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<TabAlignmentConfig>(
                        initialValue: value.tabAlignment,
                        decoration: const InputDecoration(
                          labelText: 'Alignment',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(child: Text('Default')),
                          ...TabAlignmentConfig.values.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.label),
                            ),
                          ),
                        ],
                        onChanged: (v) =>
                            _update(value.copyWith(tabAlignment: v)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<TabBarIndicatorSizeConfig>(
                        initialValue: value.indicatorSize,
                        decoration: const InputDecoration(
                          labelText: 'Indicator Size',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(child: Text('Default')),
                          ...TabBarIndicatorSizeConfig.values.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.label),
                            ),
                          ),
                        ],
                        onChanged: (v) =>
                            _update(value.copyWith(indicatorSize: v)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: NumberInputControl(
                        label: 'Divider Height',
                        value: value.dividerHeight,
                        onChanged: (v) =>
                            _update(value.copyWith(dividerHeight: v)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<TabSplashFactoryConfig>(
                        initialValue: value.splashFactory,
                        decoration: const InputDecoration(
                          labelText: 'Splash Effect',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          const DropdownMenuItem(child: Text('Default')),
                          ...TabSplashFactoryConfig.values.map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.label),
                            ),
                          ),
                        ],
                        onChanged: (v) =>
                            _update(value.copyWith(splashFactory: v)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<TabIndicatorAnimationConfig>(
                  initialValue: value.indicatorAnimation,
                  decoration: const InputDecoration(
                    labelText: 'Indicator Animation',
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem(child: Text('Default')),
                    ...TabIndicatorAnimationConfig.values.map(
                      (e) => DropdownMenuItem(value: e, child: Text(e.label)),
                    ),
                  ],
                  onChanged: (v) =>
                      _update(value.copyWith(indicatorAnimation: v)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            title: const Text('Decoration & Typography'),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              _BorderConfigEditor(
                value: value.indicatorBorder,
                onChanged: (v) => _update(value.copyWith(indicatorBorder: v)),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text('Label Padding', style: theme.textTheme.titleSmall),
              ),
              _PaddingInputs(
                value: value.labelPadding ?? const PaddingConfig(),
                onChanged: (v) => _update(value.copyWith(labelPadding: v)),
              ),
              const Divider(),
              TextStyleConfigEditor(
                label: 'Selected Label Style',
                value: value.labelStyle,
                onChanged: (s) => _update(value.copyWith(labelStyle: s)),
                onClear: () => _update(value.copyWith(labelStyle: null)),
              ),
              const SizedBox(height: 16),
              TextStyleConfigEditor(
                label: 'Unselected Label Style',
                value: value.unselectedLabelStyle,
                onChanged: (s) =>
                    _update(value.copyWith(unselectedLabelStyle: s)),
                onClear: () =>
                    _update(value.copyWith(unselectedLabelStyle: null)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BorderConfigEditor extends StatelessWidget {
  const _BorderConfigEditor({required this.value, required this.onChanged});

  final BorderConfig? value;
  final ValueChanged<BorderConfig?> onChanged;

  Future<void> _pickBorderColor(BuildContext context, BorderConfig cfg) async {
    final newColor = await context.showColorPicker(
      currentColor: cfg.borderColor?.toColor(),
    );
    if (newColor != null) {
      onChanged(cfg.copyWith(borderColor: newColor.toHex()));
    }
  }

  void _onTypeChanged(BorderTypeConfig? type, BorderConfig cfg) {
    if (type == null || type == BorderTypeConfig.none) {
      onChanged(null);
    } else {
      onChanged(cfg.copyWith(type: type));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cfg = value ?? const BorderConfig(type: BorderTypeConfig.none);
    final isNone = cfg.type == BorderTypeConfig.none;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Indicator Decoration',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<BorderTypeConfig>(
          initialValue: cfg.type,
          decoration: const InputDecoration(
            labelText: 'Type',
            isDense: true,
            border: OutlineInputBorder(),
          ),
          items: BorderTypeConfig.values
              .map(
                (type) => DropdownMenuItem<BorderTypeConfig>(
                  value: type,
                  child: Text(type.label),
                ),
              )
              .toList(),
          onChanged: (type) => _onTypeChanged(type, cfg),
        ),
        if (!isNone) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: 'Color',
                  color: cfg.borderColor?.toColor(),
                  onTap: (_) => _pickBorderColor(context, cfg),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NumberInputControl(
                  label: 'Width',
                  value: cfg.borderWidth,
                  onChanged: (v) => onChanged(cfg.copyWith(borderWidth: v)),
                ),
              ),
            ],
          ),
          if (cfg.type == BorderTypeConfig.outline) ...[
            const SizedBox(height: 12),
            NumberInputControl(
              label: 'Border Radius',
              value: cfg.borderRadius,
              onChanged: (v) => onChanged(cfg.copyWith(borderRadius: v)),
            ),
          ],
        ],
      ],
    );
  }
}

class _PaddingInputs extends StatelessWidget {
  const _PaddingInputs({required this.value, required this.onChanged});

  final PaddingConfig value;
  final ValueChanged<PaddingConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NumberInputControl(
            label: 'L',
            value: value.left,
            onChanged: (v) => onChanged(value.copyWith(left: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'T',
            value: value.top,
            onChanged: (v) => onChanged(value.copyWith(top: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'R',
            value: value.right,
            onChanged: (v) => onChanged(value.copyWith(right: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'B',
            value: value.bottom,
            onChanged: (v) => onChanged(value.copyWith(bottom: v ?? 0)),
          ),
        ),
      ],
    );
  }
}

extension BorderTypeX on BorderTypeConfig {
  String get label {
    switch (this) {
      case BorderTypeConfig.none:
        return 'None (Fill only)';
      case BorderTypeConfig.underline:
        return 'Underline';
      case BorderTypeConfig.outline:
        return 'Outline (Border)';
    }
  }
}

extension TabBarIndicatorSizeX on TabBarIndicatorSizeConfig {
  String get label {
    switch (this) {
      case TabBarIndicatorSizeConfig.tab:
        return 'Full Tab';
      case TabBarIndicatorSizeConfig.label:
        return 'Label Text';
    }
  }
}

extension TabAlignmentX on TabAlignmentConfig {
  String get label {
    switch (this) {
      case TabAlignmentConfig.start:
        return 'Start';
      case TabAlignmentConfig.startOffset:
        return 'Start Offset';
      case TabAlignmentConfig.fill:
        return 'Fill';
      case TabAlignmentConfig.center:
        return 'Center';
    }
  }
}

extension TabIndicatorAnimationX on TabIndicatorAnimationConfig {
  String get label {
    switch (this) {
      case TabIndicatorAnimationConfig.linear:
        return 'Linear';
      case TabIndicatorAnimationConfig.elastic:
        return 'Elastic';
    }
  }
}

extension TabSplashFactoryX on TabSplashFactoryConfig {
  String get label {
    switch (this) {
      case TabSplashFactoryConfig.noSplash:
        return 'No Splash';
      case TabSplashFactoryConfig.inkRipple:
        return 'Ink Ripple';
      case TabSplashFactoryConfig.inkSparkle:
        return 'Ink Sparkle';
    }
  }
}
