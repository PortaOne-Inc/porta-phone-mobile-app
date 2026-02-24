import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({
    required this.model,
    required this.onTap,
    required this.onMakeDefault,
    required this.onDelete,
    required this.onInfo,
    required this.onCopy,
    this.onChangeStatus,
    super.key,
  });

  final ThemeModel model;
  final void Function(ThemeModel model) onTap;
  final void Function(ThemeModel model) onDelete;
  final void Function(ThemeModel model) onInfo;
  final void Function(ThemeModel model) onMakeDefault;
  final void Function(ThemeModel model) onCopy;
  final void Function(ThemeModel model, ThemeStatus status)? onChangeStatus;

  static const _menuKeyDelete = '_menuKeyDelete';
  static const _menuKeyThemeDefault = '_menuKeyThemeDefault';
  static const _menuKeyInfo = '_menuKeyInfo';
  static const _menuKeyCopy = '_menuKeyCopy';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final title = model.title?.trim() ?? model.id ?? 'Undefined';

    final description = model.description?.trim();
    final hasDescription = description?.isNotEmpty ?? false;

    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => onTap(model),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        borderOnForeground: false,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PreviewBox(asset: model.previewAsset, size: 56),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (model.isDefault)
                          Tooltip(
                            message: context
                                .l10n
                                .feature_application_use_current_theme,
                            child: Icon(
                              Icons.star_rounded,
                              color: colorScheme.primary,
                            ),
                          ),
                        const SizedBox(width: 6),
                        _StatusChip(
                          status: model.status,
                          onSelected: onChangeStatus != null
                              ? (status) => onChangeStatus!(model, status)
                              : null,
                        ),
                      ],
                    ),
                    if (hasDescription) ...[
                      const SizedBox(height: 6),
                      Text(
                        description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          color: textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (model.version > 0)
                          _MetaIconText(
                            icon: Icons.auto_fix_high_outlined,
                            text: 'v${model.version}',
                          ),
                        if ((model.assetsCount ?? 0) > 0)
                          _MetaIconText(
                            icon: Icons.image_outlined,
                            text: '${model.assetsCount}',
                          ),
                        if ((model.embedsCount ?? 0) > 0)
                          _MetaIconText(
                            icon: Icons.extension_outlined,
                            text: '${model.embedsCount}',
                          ),
                        if (model.tags.isNotEmpty)
                          _MetaIconText(
                            icon: Icons.sell_outlined,
                            text:
                                model.tags.take(3).join(', ') +
                                (model.tags.length > 3 ? '…' : ''),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                offset: const Offset(0, 32),
                elevation: 6,
                onSelected: _handleMenuTap,
                padding: const EdgeInsets.only(top: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                itemBuilder: (c) => [
                  const PopupMenuItem(
                    value: _menuKeyCopy,
                    padding: EdgeInsets.all(8),
                    child: Text('Copy'),
                  ),
                  PopupMenuItem(
                    value: _menuKeyThemeDefault,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      context.l10n.feature_application_use_current_theme,
                    ),
                  ),
                  PopupMenuItem(
                    value: _menuKeyInfo,
                    padding: const EdgeInsets.all(8),
                    child: Text(context.l10n.feature_theme_info),
                  ),
                  PopupMenuItem(
                    value: _menuKeyDelete,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      context.l10n.common_text_delete,
                      style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                    ),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.more_vert_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuTap(String key) {
    switch (key) {
      case _menuKeyInfo:
        onInfo(model);
        return;
      case _menuKeyDelete:
        onDelete(model);
        return;
      case _menuKeyThemeDefault:
        onMakeDefault(model);
        return;
      case _menuKeyCopy:
        onCopy(model);
        return;
    }
  }
}

class _PreviewBox extends StatelessWidget {
  const _PreviewBox({required this.asset, this.size = 48});

  final AssetModel? asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cs.outlineVariant),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_outlined,
        size: size * 0.5,
        color: cs.onSurfaceVariant,
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status, this.onSelected});

  final ThemeStatus status;
  final ValueChanged<ThemeStatus>? onSelected;

  static (Color bg, Color fg, String label) _style(ThemeStatus s, ThemeData t) =>
      switch (s) {
        ThemeStatus.draft => (
          t.colorScheme.surfaceContainerHighest,
          t.colorScheme.onSurface,
          'Draft',
        ),
        ThemeStatus.published => (
          t.colorScheme.primaryContainer,
          t.colorScheme.onPrimaryContainer,
          'Published',
        ),
        ThemeStatus.archived => (
          t.colorScheme.surfaceContainerHigh,
          t.colorScheme.onSurfaceVariant,
          'Archived',
        ),
      };

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final (bg, fg, label) = _style(status, t);

    final chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: t.textTheme.labelSmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (onSelected != null) ...[
            const SizedBox(width: 2),
            Icon(Icons.arrow_drop_down, size: 16, color: fg),
          ],
        ],
      ),
    );

    if (onSelected == null) return chip;

    return PopupMenuButton<ThemeStatus>(
      onSelected: onSelected,
      offset: const Offset(0, 32),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      itemBuilder: (_) => ThemeStatus.values.map((s) {
        final (_, _, itemLabel) = _style(s, t);
        return PopupMenuItem(
          value: s,
          enabled: s != status,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(itemLabel),
        );
      }).toList(),
      child: chip,
    );
  }
}

class _MetaIconText extends StatelessWidget {
  const _MetaIconText({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: cs.onSurfaceVariant),
        const SizedBox(width: 6),
        Text(text, style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
      ],
    );
  }
}
