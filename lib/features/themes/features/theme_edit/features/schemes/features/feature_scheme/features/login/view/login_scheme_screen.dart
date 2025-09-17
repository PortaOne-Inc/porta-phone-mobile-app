import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class LoginSchemeScreen extends StatefulWidget {
  const LoginSchemeScreen({
    required this.callback,
    required this.sourceAppConfigLogin,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final ObjectCallback<AppConfigLogin> callback;

  @override
  State<LoginSchemeScreen> createState() => _LoginSchemeScreenState();
}

class _LoginSchemeScreenState extends State<LoginSchemeScreen> {
  final _greetingLabelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.sourceAppConfigLogin.greetingL10n != null) {
      _greetingLabelController.text = widget.sourceAppConfigLogin.greetingL10n!;
    }

    _greetingLabelController.addListener(() {
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        greetingL10n: _greetingLabelController.text,
      ));
    });
  }

  @override
  void dispose() {
    _greetingLabelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Welcome page',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlineInput(
                  controller: _greetingLabelController,
                  label: 'Greeting',
                  icon: Icons.title,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Mode actions',
            trailing: InkWell(
              onTap: _addActionPage,
              child: const Icon(Icons.add),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.sourceAppConfigLogin.modeSelectActions.map(
                  (action) => _ActionCard(
                    action: action,
                    onMenuSelected: (value) => _modeSelectActionsMenuHandler(value, action),
                    colorScheme: colorScheme,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _modeSelectActionsMenuHandler(String value, AppConfigModeSelectAction action) {
    if (value == 'enable_disable') {
      _manageModeSelectAvailability(action: action);
    } else if (value == 'delete') {
      final updatedActions = List<AppConfigModeSelectAction>.from(widget.sourceAppConfigLogin.modeSelectActions)
        ..remove(action);
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        modeSelectActions: updatedActions,
      ));
    }
  }

  Future<void> _addActionPage() async {
    final action =
        await context.pushNamed<AppConfigModeSelectAction>(SchemeRoute.appFeatureSchemeAddLoginModeAction.name);

    if (action != null) {
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        modeSelectActions: [...widget.sourceAppConfigLogin.modeSelectActions, action],
      ));
    }
  }

  void _manageModeSelectAvailability({
    required AppConfigModeSelectAction action,
  }) {
    widget.callback(widget.sourceAppConfigLogin.copyWith(
      modeSelectActions: widget.sourceAppConfigLogin.modeSelectActions.map((e) {
        if (e == action) return e.copyWith(enabled: !e.enabled);
        return e;
      }).toList(),
    ));
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.action,
    required this.onMenuSelected,
    required this.colorScheme,
  });

  final AppConfigModeSelectAction action;
  final ValueChanged<String> onMenuSelected;
  final ColorScheme colorScheme;

  bool get _isLogin => action.type == 'login';

  bool get _isEmbedded => action.type == 'embedded';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  action.enabled ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: action.enabled ? colorScheme.primary : colorScheme.outline,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    action.titleL10n,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: action.enabled ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: action.enabled ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _TypePill(type: action.type, colorScheme: colorScheme),
                const SizedBox(width: 4),
                PopupMenuButton<String>(
                  onSelected: onMenuSelected,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'enable_disable',
                      child: Text(action.enabled ? 'Disable' : 'Enable'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),

            // Embedded id caption (only for embedded with id)
            if (_isEmbedded && (action.embeddedId?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 6),
              Text(
                'Embedded: ${action.embeddedId}',
                style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ],

            // Chips row: show only relevant chips
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                if (_isLogin)
                  _StatusChip(
                    label: 'Launch btn',
                    value: action.isLaunchButtonVisible,
                    colorScheme: colorScheme,
                  ),
                if (_isEmbedded)
                  _StatusChip(
                    label: 'Launch screen',
                    value: action.isLaunchScreen,
                    colorScheme: colorScheme,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TypePill extends StatelessWidget {
  const _TypePill({required this.type, required this.colorScheme});

  final String type;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final isLogin = type == 'login';
    final bg = isLogin ? colorScheme.secondaryContainer : colorScheme.tertiaryContainer;
    final fg = isLogin ? colorScheme.onSecondaryContainer : colorScheme.onTertiaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.value,
    required this.colorScheme,
  });

  final String label;
  final bool value;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final bg = value ? colorScheme.primary.withValues(alpha: 0.14) : colorScheme.surfaceTint;
    final fg = value ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: value ? colorScheme.primary.withValues(alpha: 0.35) : colorScheme.outlineVariant,
        ),
      ),
      child: Text(
        '$label: ${value ? "yes" : "no"}',
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
