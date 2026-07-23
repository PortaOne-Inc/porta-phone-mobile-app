import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../routes/scheme_route.dart' show SchemeRoute;

class LoginSchemeWelcome extends StatefulWidget {
  const LoginSchemeWelcome({
    required this.config,
    required this.callback,
    super.key,
  });

  final AppConfigLoginModeSelect config;
  final ObjectCallback<AppConfigLoginModeSelect> callback;

  @override
  State<LoginSchemeWelcome> createState() => _LoginSchemeWelcomeState();
}

class _LoginSchemeWelcomeState extends State<LoginSchemeWelcome> {
  final _greetingLabelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final g = widget.config.greetingL10n;
    if (g != null) _greetingLabelController.text = g;

    _greetingLabelController.addListener(() {
      widget.callback(
        widget.config.copyWith(greetingL10n: _greetingLabelController.text),
      );
    });
  }

  @override
  void dispose() {
    _greetingLabelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final actions = widget.config.actions;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Central welcome message',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlineInput(
                controller: _greetingLabelController,
                label: 'Welcome message',
                icon: Icons.title,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Buttons and actions',
          description:
              'Buttons shown on the welcome screen that can trigger native login or open an embedded web page.',
          trailing: IconButton(
            tooltip: 'Add action',
            onPressed: _addActionPage,
            icon: const Icon(Icons.add),
          ),
          child: actions.isEmpty
              ? _EmptyActionsPlaceholder(onAdd: _addActionPage)
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: actions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final action = actions[index];
                    return _ActionCard(
                      action: action,
                      colorScheme: cs,
                      onMenuSelected: (value) =>
                          _modeSelectActionsMenuHandler(value, action),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Future<void> _addActionPage() async {
    final action = await context.pushNamed<AppConfigModeSelectAction>(
      SchemeRoute.appFeatureSchemeAddLoginModeAction.name,
    );
    widget.callback(
      widget.config.copyWith(
        actions: [...widget.config.actions, if (action != null) action],
      ),
    );
  }

  void _modeSelectActionsMenuHandler(
    String value,
    AppConfigModeSelectAction action,
  ) {
    final actions = widget.config.actions.toList();
    final index = actions.indexOf(action);
    if (index == -1) return;

    switch (value) {
      case 'enable_disable':
        final updatedAction = action.copyWith(enabled: !action.enabled);
        actions[index] = updatedAction;
      case 'delete':
        actions.removeAt(index);
    }

    widget.callback(widget.config.copyWith(actions: actions));
  }
}

class _EmptyActionsPlaceholder extends StatelessWidget {
  const _EmptyActionsPlaceholder({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'No actions added yet. Use the + button to add your first action.',
              style: tt.bodyMedium,
            ),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ],
      ),
    );
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

  bool get _isEmbedded => action.type == 'embedded';

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  action.enabled
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: action.enabled
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    action.titleL10n,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: action.enabled
                          ? colorScheme.onSurface
                          : colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: action.enabled
                          ? FontWeight.w600
                          : FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _TypePill(type: action.type, colorScheme: colorScheme),
                const SizedBox(width: 4),
                PopupMenuButton<String>(
                  tooltip: 'Action menu',
                  onSelected: onMenuSelected,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'enable_disable',
                      child: Text(action.enabled ? 'Disable' : 'Enable'),
                    ),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ],
            ),
            if (_isEmbedded && (action.embeddedId?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 6),
              Text(
                'Embedded: ${action.embeddedId}',
                style: tt.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
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
    final bg = isLogin
        ? colorScheme.secondaryContainer
        : colorScheme.tertiaryContainer;
    final fg = isLogin
        ? colorScheme.onSecondaryContainer
        : colorScheme.onTertiaryContainer;

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
