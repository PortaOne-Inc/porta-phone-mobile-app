import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/configure/feature_access/view/add_mode_action_view.dart';

import 'add_embedded_view.dart';

class BuildLoginConfig extends StatefulWidget {
  const BuildLoginConfig({
    required this.callback,
    required this.sourceAppConfigLogin,
    required this.assets,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final List<ThemeAssetModel> assets;
  final ObjectCallback<AppConfigLogin> callback;

  @override
  State<BuildLoginConfig> createState() => _BuildLoginConfigState();
}

class _BuildLoginConfigState extends State<BuildLoginConfig> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Mode actions',
            trailing: InkWell(
              child: const Icon(Icons.add),
              onTap: _addActionPage,
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
                          color: action.enabled ? colorScheme.onSurface : colorScheme.onSurface.withOpacity(0.5),
                          fontWeight: action.enabled ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text('Type: ${action.type}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // To align the trailing row correctly
                        children: [
                          DropdownButton<AppConfigLoginEmbedded>(
                            hint: const Text('Select embedded'),
                            padding: EdgeInsets.zero,
                            underline: Container(),
                            // Removes the underline
                            items: widget.sourceAppConfigLogin.embedded.map((embedded) {
                              return DropdownMenuItem<AppConfigLoginEmbedded>(
                                value: embedded,
                                child: Text(embedded.titleL10n.toString()),
                              );
                            }).toList(),
                            onChanged: (selectedEmbedded) {
                              if (selectedEmbedded != null) {
                                // Logic when an embedded item is selected
                                _onEmbeddedItemSelected(action, selectedEmbedded);
                              }
                            },
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'enable_disable') {
                                _manageModeSelectAvailability(action: action);
                              } else if (value == 'edit') {
                                _addOrEditModeSelectAction(action: action);
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
                                value: 'edit',
                                child: Text('Edit'),
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
                }).toList(),
              ],
            ),
          ),
          SizedBox(height: 16),
          BorderContainer(
            title: 'Embedded data',
            trailing: InkWell(
              child: const Icon(Icons.add),
              onTap: _addEmbeddedPage,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.sourceAppConfigLogin.embedded.map((action) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.data_array),
                      title: Text(action.titleL10n.toString()),
                      subtitle: Text('Type: ${action.titleL10n}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'enable_disable') {
                            setState(() {
                              // action.enabled = !action.enabled;
                            });
                          } else if (value == 'edit') {
                          } else if (value == 'delete') {
                            setState(() {
                              widget.sourceAppConfigLogin.modeSelectActions.remove(action);
                            });
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onEmbeddedItemSelected(AppConfigModeSelectAction action, AppConfigLoginEmbedded selectedEmbedded) {
    // Example logic when an embedded item is selected
    setState(() {
      ///     action.embeddedId = selectedEmbedded.id;
    });
  }

  void _addOrEditModeSelectAction({AppConfigModeSelectAction? action, int? index}) {}

  Future _addEmbeddedPage() async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute<AppConfigLoginEmbedded>(
        builder: (BuildContext context) => AddEmbeddedPage(
          assets: widget.assets,
        ),
      ),
    );
    if (res != null)
      widget.callback(widget.sourceAppConfigLogin.copyWith(
        embedded: [...widget.sourceAppConfigLogin.embedded, res],
      ));
  }

  Future _addActionPage() async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute<AppConfigModeSelectAction>(
        builder: (BuildContext context) => AddModeActionPage(
          assets: widget.assets,
          embedded: widget.sourceAppConfigLogin.embedded,
        ),
      ),
    );

    print(res);

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
