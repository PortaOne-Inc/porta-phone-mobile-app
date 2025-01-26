import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/route/route.dart';

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
  late final _titleL10nController = TextEditingController(text: widget.bottomMenuTabScheme?.titleL10n ?? '');

  EmbeddedData? _selectedEmbedded;
  bool _enable = false;

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
              const SizedBox(height: 16),
              TextFormField(
                controller: TextEditingController(text: _bottomMenuTabScheme?.type.name ?? ''),
                decoration: const InputDecoration(
                  labelText: 'Select Type',
                  border: OutlineInputBorder(),
                  enabled: false,
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Enable'),
                value: _enable,
                onChanged: (value) => setState(() {
                  _enable = value;
                }),
              ),
              ListTile(
                title: Text(_selectedEmbedded?.toString() ?? 'Add Embedded Data'),
                trailing: Icon(_selectedEmbedded == null ? Icons.add : Icons.edit),
                onTap: _addEmbeddedPage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addEmbeddedPage() async {
    _selectedEmbedded =
        await GoRouter.of(context).pushNamed<EmbeddedData>(SchemeRoute.appFeatureSchemeAddEmbeddedData.name);
  }

  void _saveData() {
    GoRouter.of(context).pop(_bottomMenuTabScheme?.copyWith(
      titleL10n: _titleL10nController.text,
      enabled: _enable,
    ));
  }
}
