import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import 'add_mode_action_view.dart';

class LoginSchemeScreen extends StatefulWidget {
  const LoginSchemeScreen({
    required this.callback,
    required this.sourceAppConfigLogin,
    required this.assets,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final List<ThemeAssetModel> assets;
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
                )
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.sourceAppConfigLogin.modeSelectActions.map((action) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: action.enabled
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank_sharp),
                      title: Text(
                        action.titleL10n,
                        style: TextStyle(
                          color: action.enabled ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.5),
                          fontWeight: action.enabled ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text('Type: ${action.type}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // To align the trailing row correctly
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'enable_disable') {
                                _manageModeSelectAvailability(action: action);
                              } else if (value == 'delete') {
                                setState(() {
                                  widget.sourceAppConfigLogin.modeSelectActions.remove(action);
                                });
                              }
                            },
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
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Embedded data',
            trailing: InkWell(
              onTap: _addEmbeddedPage,
              child: const Icon(Icons.add),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.sourceAppConfigLogin.embedded.map((action) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.data_array),
                      title: Text(action.toolbar.titleL10n.toString()),
                      subtitle: Text('Type: ${action.toolbar.titleL10n}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'enable_disable') {
                            setState(() {
                              // action.enabled = !action.enabled;
                            });
                          } else if (value == 'delete') {
                            setState(() {
                              widget.sourceAppConfigLogin.modeSelectActions.remove(action);
                            });
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addEmbeddedPage() async {
    final res = await GoRouter.of(context).pushNamed<EmbeddedData>(SchemeRoute.appFeatureSchemeAddEmbeddedData.name);
    if (res != null) {
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        embedded: [...widget.sourceAppConfigLogin.embedded, res],
      ));
    }
  }

  Future<void> _addActionPage() async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute<AppConfigModeSelectAction>(
        builder: (BuildContext context) => AddModeActionPage(
          embedded: widget.sourceAppConfigLogin.embedded,
        ),
      ),
    );

    if (res != null) {
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        modeSelectActions: [...widget.sourceAppConfigLogin.modeSelectActions, res],
      ));
      // Logic when embedded data is added
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
