import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

// TODO(Serdun): Do correct, add bloc
class ManageMenuTabScreen extends StatefulWidget {
  const ManageMenuTabScreen({
    super.key,
    this.bottomMenuTabScheme,
  });

  final BottomMenuTabScheme? bottomMenuTabScheme;

  @override
  _ManageMenuTabScreenState createState() => _ManageMenuTabScreenState();
}

class _ManageMenuTabScreenState extends State<ManageMenuTabScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _bottomMenuTabScheme = widget.bottomMenuTabScheme;
  late var _bottomMenuType = widget.bottomMenuTabScheme?.type;
  late final _titleL10nController = TextEditingController(text: widget.bottomMenuTabScheme?.titleL10n ?? '');

  EmbeddedResourceModel? _selectedEmbedded;

  // Common configuration
  bool _enableTab = true;

  // Contacts configuration
  bool _contactsSubTabLocale = true;
  bool _contactsSubTabPBX = true;

  @override
  void initState() {
    if (_bottomMenuTabScheme is ContactsTabScheme) {
      _contactsSubTabLocale = _bottomMenuTabScheme.contactSourceTypes.contains('local');
      _contactsSubTabPBX = _bottomMenuTabScheme.contactSourceTypes.contains('external');
    } else {
      _contactsSubTabLocale = true;
      _contactsSubTabPBX = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Embedded Section'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveData,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleL10nController,
                decoration: const InputDecoration(
                  labelText: 'Title Localization',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonExt<BottomMenuTabType>(
                label: 'Bottom menu tab type',
                value: _bottomMenuType,
                options: BottomMenuTabType.values,
                onChanged: (value) => setState(() {
                  _bottomMenuType = value;
                }),
                optionBuilder: (value) => value.name,
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: _bottomMenuType?.isEmbedded ?? false,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(_selectedEmbedded?.displayLabel() ?? 'Add Embedded Data'),
                  subtitle: const Text('To display in embedded pages.'),
                  leading: Icon(_selectedEmbedded == null ? Icons.add : Icons.edit),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: _addEmbeddedPage,
                ),
              ),
              BorderContainer(
                title: 'Tab availability',
                child: SwitchListTile(
                    title: const Text('Enable'),
                    value: _enableTab,
                    onChanged: (value) => setState(() {
                          _enableTab = !_enableTab;
                        })),
              ),
              const SizedBox(height: 16),
              if (_bottomMenuType == BottomMenuTabType.contacts)
                BorderContainer(
                  title: 'Available sub-tabs',
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text('Add embedded tab'),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        title: const Text('Enable local contacts'),
                        value: _contactsSubTabLocale,
                        onChanged: (value) => setState(() {
                          _contactsSubTabLocale = value;
                        }),
                      ),
                      SwitchListTile(
                        title: const Text('Enable pbx contacts'),
                        value: _contactsSubTabPBX,
                        onChanged: (value) => setState(() {
                          _contactsSubTabPBX = value;
                        }),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addEmbeddedPage() async {
    final embeds = context.read<UpdateThemCubit>().state.embeds;

    final picked = await EmbedPickerDialog.show(
      context,
      title: 'Select embeds',
      items: embeds,
    );

    _selectedEmbedded = picked!.first;
    setState(() {});
  }

  void _saveData() {
    if (_bottomMenuTabScheme?.type == BottomMenuTabType.contacts) {
      final updatedTab = ContactsTabScheme(
        enabled: _enableTab,
        initial: _bottomMenuTabScheme?.initial ?? false,
        type: BottomMenuTabType.contacts,
        titleL10n: _titleL10nController.text,
        icon: _bottomMenuTabScheme?.icon ?? '',
        contactSourceTypes: [
          if (_contactsSubTabLocale) 'local',
          if (_contactsSubTabPBX) 'external',
        ],
      );

      GoRouter.of(context).pop(updatedTab);
      return;
    }

    if (_bottomMenuType?.isEmbedded ?? false) {
      final updatedTab = EmbededTabScheme(
        enabled: _enableTab,
        initial: _bottomMenuTabScheme?.initial ?? false,
        type: _bottomMenuType!,
        titleL10n: _titleL10nController.text,
        icon: _bottomMenuTabScheme?.icon ?? '0xe556',
        embeddedResourceId: _selectedEmbedded!.id!,
      );

      GoRouter.of(context).pop(updatedTab);
      return;
    }

    final updatedTab = BaseTabScheme(
      enabled: _enableTab,
      initial: _bottomMenuTabScheme?.initial ?? false,
      type: _bottomMenuType!,
      titleL10n: _titleL10nController.text,
      icon: _bottomMenuTabScheme?.icon ?? '0xe5fd',
    );

    GoRouter.of(context).pop(updatedTab);
  }
}
