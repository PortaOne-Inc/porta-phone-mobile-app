import 'dart:typed_data';

import 'package:domain/entity/models/theme/theme_asset_model.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:logging/logging.dart';
import '../../../../model/models.dart';
import 'assets_view.dart';

final _logger = Logger('AddFilePage');

class AddFilePage extends StatefulWidget {
  @override
  _AddFilePageState createState() => _AddFilePageState();
}

class _AddFilePageState extends State<AddFilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Uint8List? file;

  Future<void> _onSelectHtmlFile() async {
    final result = await filePicker.FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      file = result.files.first.bytes; // Замість path використовується bytes
      final fileName = result.files.first.name;
    } else {
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New File'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add File Details',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'File Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _onSelectHtmlFile,
                icon: Icon(Icons.attach_file),
                label: Text('Pick File'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  final description = _descriptionController.text.trim();
                  if (name.isNotEmpty && description.isNotEmpty) {
                    Navigator.pop(
                      context,
                      ThemeAssetModel.create(name: name, description: description, file: file!),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields.')),
                    );
                  }
                },
                child: Text('Add File'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
