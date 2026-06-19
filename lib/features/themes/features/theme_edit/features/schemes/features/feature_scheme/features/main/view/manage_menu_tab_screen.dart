import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../utils/utils.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ManageMenuTabScreen extends StatefulWidget {
  const ManageMenuTabScreen({super.key, this.bottomMenuTabScheme});

  final BottomMenuTabScheme? bottomMenuTabScheme;

  @override
  State<ManageMenuTabScreen> createState() => _ManageMenuTabScreenState();
}

class _ManageMenuTabScreenState extends State<ManageMenuTabScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TabFormModel _form = TabFormModel.fromScheme(widget.bottomMenuTabScheme);

  // UI controllers are local to the screen
  late final _titleL10nController = TextEditingController(text: _form.title);
  late final _iconController = TextEditingController(text: _form.icon);

  @override
  void dispose() {
    _titleL10nController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmbedded = _form.kind == BottomMenuTabKind.embedded;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bottom Menu Tab'),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.save), onPressed: _save)],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TabTypeDropdown(value: _form.kind, onChanged: (k) => setState(() => _form.kind = k)),
              const SizedBox(height: 12),
              CommonFields(
                titleController: _titleL10nController,
                iconController: _iconController,
                enabled: _form.enabled,
                initial: _form.initial,
                onEnabledChanged: (v) => setState(() => _form.enabled = v),
                onInitialChanged: (v) => setState(() => _form.initial = v),
              ),
              const SizedBox(height: 16),
              _buildTypeSpecific(),
              if (isEmbedded) ...[
                const SizedBox(height: 16),
                EmbeddedPickerTile(
                  selectedTitle: _form.embeddedResourceId ?? 'Select embedded resource',
                  onTap: _pickEmbedded,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSpecific() {
    switch (_form.kind) {
      case BottomMenuTabKind.favorites:
      case BottomMenuTabKind.keypad:
      case BottomMenuTabKind.messaging:
        return const SizedBox.shrink();
      case BottomMenuTabKind.recents:
        return RecentsFields(
          supportsCallHistory: _form.supportsCallHistory,
          onSupportsCallHistoryChanged: (v) => setState(() => _form.supportsCallHistory = v),
        );
      case BottomMenuTabKind.contacts:
        return ContactsFields(
          local: _form.contactsLocal,
          external: _form.contactsExternal,
          onLocalChanged: (v) => setState(() => _form.contactsLocal = v),
          onExternalChanged: (v) => setState(() => _form.contactsExternal = v),
        );
      case BottomMenuTabKind.embedded:
        return const SizedBox.shrink();
    }
  }

  Future<void> _pickEmbedded() async {
    final embeds = context.read<UpdateThemCubit>().state.embeddedResources;
    final picked = await EmbedPickerDialog.show(context, title: 'Select embedded resource', items: embeds);
    setState(() => _form.embeddedResourceId = picked?.first.id);
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    _form.title = _titleL10nController.text;
    _form.icon = _iconController.text;

    try {
      final updated = buildSchemeFromForm(_form);
      GoRouter.of(context).pop(updated);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
