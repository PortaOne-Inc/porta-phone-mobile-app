import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webtrit_configurator/core/exports/exports.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_phone/extensions/string.dart';

import '../bloc/manage_setting_item_cubit.dart';

final _logger = Logger('AddSettingItemScreen');

class AddSettingItemScreen extends StatefulWidget {
  const AddSettingItemScreen({
    super.key,
  });

  @override
  _AddSettingItemScreenState createState() => _AddSettingItemScreenState();
}

class _AddSettingItemScreenState extends State<AddSettingItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleL10nController = TextEditingController();
  final _settingItemIconController = TextEditingController();

  ManageSettingItemCubit get cubit => context.read<ManageSettingItemCubit>();

  @override
  void initState() {
    super.initState();

    _settingItemIconController
      ..text = cubit.state.settingItemIcon ?? ''
      ..addListener(() {
        cubit.chaneSettingItemIcon(_settingItemIconController.text);
      });

    _titleL10nController
      ..text = cubit.state.titleL10n ?? ''
      ..addListener(() {
        cubit.changeTitleL10n(_titleL10nController.text);
      });
  }

  @override
  void dispose() {
    _titleL10nController.dispose();
    _settingItemIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ManageSettingItemCubit, ManageSettingItemState>(
      listener: _handleListener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Embedded Section',
              style: textTheme.titleMedium,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: state.isFormValid ? _saveData : null,
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: TextEditingController(text: state.type),
                    decoration: const InputDecoration(
                      labelText: 'Select Type',
                      border: OutlineInputBorder(),
                      enabled: false,
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _titleL10nController,
                    decoration: const InputDecoration(
                      labelText: 'Title Localization',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                    validator: (value) => (value?.trim().isEmpty ?? true) ? 'Title is required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _settingItemIconController,
                    decoration: InputDecoration(
                      labelText: 'Setting Item icon',
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(getSettingItemIcon()),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _launchUrl,
                      ),
                    ),
                    validator: (value) => (value?.trim().isEmpty ?? true) ? 'Title is required' : null,
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Enable'),
                    value: state.enable,
                    onChanged: (value) => cubit.changeEnable(value),
                  ),
                  ListTile(
                    title: state.selectedEmbeddedResource == null
                        ? const Text('Add Embedded Data')
                        : Card(
                            margin: EdgeInsets.zero,
                            child: ListTile(
                              title: Text(state.selectedEmbeddedResource!.uri),
                              subtitle: Text(state.selectedEmbeddedResource!.id.toString()),
                            ),
                          ),
                    trailing: state.selectedEmbeddedResource == null ? const Icon(Icons.add) : const Icon(Icons.edit),
                    onTap: _addEmbeddedResource,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _addEmbeddedResource() async {
    final selectedEmbedded =
        await context.pushNamed<EmbeddedResource>(SchemeRoute.appFeatureSchemeCollectionEmbedded.name);
    if (selectedEmbedded != null) {
      cubit.assignEmbeddedPage(selectedEmbedded);
    }
  }

  void _handleListener(BuildContext context, ManageSettingItemState state) {
    if (state.resultSettingItem != null) {
      Navigator.pop(context, state.resultSettingItem);
    }
  }

  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      cubit.apply();
    }
  }

  IconData getSettingItemIcon() {
    try {
      return _settingItemIconController.text.toIconData();
    } catch (e) {
      _logger.info('Failed to parse icon data: $e');
      return Icons.image;
    }
  }

  Future<void> _launchUrl() async {
    const url = 'https://fonts.google.com/icons';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _logger.warning('Could not launch URL: $url');
    }
  }
}
