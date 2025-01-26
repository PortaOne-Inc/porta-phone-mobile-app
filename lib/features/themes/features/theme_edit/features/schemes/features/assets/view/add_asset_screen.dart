import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/features.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

final _logger = Logger('AddAssetScreen');

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({
    super.key,
  });

  @override
  _AddAssetScreenState createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Uint8List? file;
  String? fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new asset'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _onAddFile,
            icon: const Icon(Icons.check),
            tooltip: 'Add File',
          ),
        ],
      ),
      body: BlocListener<AssetsCubit, AssetsState>(
        listener: (context, state) {
          if (state.asset != null) GoRouter.of(context).pop(state.asset);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add File Details',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 16),
                OutlineInput(
                  controller: _nameController,
                  label: 'File Name',
                  icon: Icons.text_fields,
                ),
                const SizedBox(height: 16),
                OutlineInput(
                  controller: _descriptionController,
                  label: 'Description',
                  icon: Icons.description,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                ElevatedButton.icon(
                  onPressed: _onSelectHtmlFile,
                  icon: const Icon(Icons.attach_file),
                  label: const Text('Pick File'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSelectHtmlFile() async {
    final result = await file_picker.FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      file = result.files.first.bytes;
      fileName = result.files.first.name;
    } else {
      _logger.info('No file selected.');
    }
  }

  void _onAddFile() {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    context.read<AssetsCubit>().createAsset(name, description, ThemeAssetType.unknown, fileName!, file!);
  }
}
