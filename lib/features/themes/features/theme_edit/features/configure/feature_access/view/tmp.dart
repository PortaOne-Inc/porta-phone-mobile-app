import 'package:data/dto/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ManageStructureWidget extends StatefulWidget {
  final List<AppConfigModeSelectAction> initialModeSelectActions;
  final List<AppConfigLoginEmbedded> initialEmbedded;

  const ManageStructureWidget({
    required this.initialModeSelectActions,
    required this.initialEmbedded,
    Key? key,
  }) : super(key: key);

  @override
  _ManageStructureWidgetState createState() => _ManageStructureWidgetState();
}

class _ManageStructureWidgetState extends State<ManageStructureWidget> {
  late List<AppConfigModeSelectAction> modeSelectActions;
  late List<AppConfigLoginEmbedded> embedded;

  @override
  void initState() {
    super.initState();
    modeSelectActions = List.from(widget.initialModeSelectActions);
    embedded = List.from(widget.initialEmbedded);
  }

  void _addOrEditModeSelectAction({AppConfigModeSelectAction? action, int? index}) {
    final TextEditingController typeController = TextEditingController(
      text: action?.type ?? '',
    );
    final TextEditingController titleController = TextEditingController(
      text: action?.titleL10n ?? '',
    );
    bool enabled = action?.enabled ?? true;
    int? embeddedId = action?.embeddedId;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(action == null ? 'Add Action' : 'Edit Action'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: typeController,
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title L10n'),
              ),
              SwitchListTile(
                title: Text('Enabled'),
                value: enabled,
                onChanged: (value) {
                  setState(() {
                    enabled = value;
                  });
                },
              ),
              if (embeddedId != null)
                TextField(
                  decoration: InputDecoration(labelText: 'Embedded ID'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    embeddedId = int.tryParse(value);
                  },
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newAction = AppConfigModeSelectAction(
                  enabled: enabled,
                  type: typeController.text,
                  titleL10n: titleController.text,
                  embeddedId: embeddedId,
                );
                setState(() {
                  if (index != null) {
                    modeSelectActions[index] = newAction;
                  } else {
                    modeSelectActions.add(newAction);
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addOrEditEmbedded({AppConfigLoginEmbedded? item, int? index}) {
    final TextEditingController resourceController = TextEditingController(
      text: item?.resource ?? '',
    );
    final TextEditingController titleController = TextEditingController(
      text: item?.titleL10n ?? '',
    );
    bool launch = item?.launch ?? false;
    bool showToolbar = item?.showToolbar ?? true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? 'Add Embedded' : 'Edit Embedded'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title L10n'),
              ),
              TextField(
                controller: resourceController,
                decoration: InputDecoration(labelText: 'Resource'),
              ),
              SwitchListTile(
                title: Text('Launch'),
                value: launch,
                onChanged: (value) {
                  setState(() {
                    launch = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Show Toolbar'),
                value: showToolbar,
                onChanged: (value) {
                  setState(() {
                    showToolbar = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newEmbedded = AppConfigLoginEmbedded(
                  id: item?.id ?? DateTime.now().millisecondsSinceEpoch,
                  launch: launch,
                  showToolbar: showToolbar,
                  titleL10n: titleController.text,
                  resource: resourceController.text,
                );
                setState(() {
                  if (index != null) {
                    embedded[index] = newEmbedded;
                  } else {
                    embedded.add(newEmbedded);
                  }
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Mode Select Actions'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addOrEditModeSelectAction(),
          ),
        ),
        ...modeSelectActions.asMap().entries.map((entry) {
          int index = entry.key;
          AppConfigModeSelectAction action = entry.value;
          return ListTile(
            title: Text(action.titleL10n),
            subtitle: Text('Type: ${action.type}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrEditModeSelectAction(action: action, index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      modeSelectActions.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
        Divider(),
        ListTile(
          title: Text('Embedded'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addOrEditEmbedded(),
          ),
        ),
        ...embedded.asMap().entries.map((entry) {
          int index = entry.key;
          AppConfigLoginEmbedded embed = entry.value;
          return ListTile(
            title: Text(embed.titleL10n ?? 'Untitled'),
            subtitle: Text('Resource: ${embed.resource}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _addOrEditEmbedded(item: embed, index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      embedded.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
