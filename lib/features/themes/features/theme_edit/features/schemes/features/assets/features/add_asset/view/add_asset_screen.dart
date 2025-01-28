import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/features.dart';

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

  Uint8List? _file;
  String? _fileName;
  bool _isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateSaveButtonState);
    _descriptionController.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSaveEnabled = _file != null &&
          _fileName != null &&
          _nameController.text.trim().isNotEmpty &&
          _descriptionController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAssetCubit, AddAssetState>(
      listener: (context, state) {
        if (state.asset != null) {
          GoRouter.of(context).pop(state.asset);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add New Asset'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: _isSaveEnabled && !state.status.isLoading ? _onSave : null,
                icon: state.status.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 1),
                      )
                    : const Icon(Icons.upload),
                tooltip: 'Save Asset',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UrlImageField(
                    title: 'Select Image',
                    resource: _file != null ? ByteResource(_file!) : null,
                    constraints: BoxConstraints.loose(const Size(200, 200)),
                    onTap: _onSelectFile,
                  ),
                  const SizedBox(height: 16),
                  OutlineInput(
                    controller: _nameController,
                    label: 'File Name',
                    icon: Icons.text_fields,
                  ),
                  const SizedBox(height: 8),
                  OutlineInput(
                    controller: _descriptionController,
                    label: 'Description',
                    icon: Icons.description,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSelectFile() async {
    final result = await file_picker.FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _file = result.files.first.bytes;
        _fileName = result.files.first.name;
      });
      _updateSaveButtonState();
    } else {
      _logger.info('No file selected.');
    }
  }

  void _onSave() {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();

    context.read<AddAssetCubit>().createAsset(
          name,
          description,
          _fileName!,
          _file!,
        );
  }
}
