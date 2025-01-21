import 'package:domain/entity/models/theme/theme_asset_model.dart';
import 'package:flutter/material.dart';

import '../../../../model/models.dart';
import 'add_assets_view.dart';

class AssetsView extends StatefulWidget {
  const AssetsView({
    required this.assets,
    required this.onUpdate,
    super.key,
  });

  final List<ThemeAssetModel> assets;
  final ValueChanged<List<ThemeAssetModel>> onUpdate;

  @override
  _AssetsViewState createState() => _AssetsViewState();
}

class _AssetsViewState extends State<AssetsView> {
  void initState() {
    super.initState();
  }

  void _navigateToAddFilePage() async {
    final newFile = await Navigator.push<ThemeAssetModel>(
      context,
      MaterialPageRoute(
        builder: (context) => AddFilePage(),
      ),
    );

    if (newFile != null) {
      widget.onUpdate([...widget.assets, newFile]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildAddFileButton(),
                ...widget.assets.map((file) => _buildFileCard(file)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddFileButton() {
    return GestureDetector(
      onTap: _navigateToAddFilePage,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 48, color: Colors.grey[700]),
              SizedBox(height: 8),
              Text('Add File', style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileCard(ThemeAssetModel file) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.web,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              file.name ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              file.description ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
