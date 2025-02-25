import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/routes/scheme_route.dart';

class CollectionEmbedded extends StatelessWidget {
  const CollectionEmbedded({
    required this.embeddedResources,
    required this.callback,
    this.isPicker = false,
    super.key,
  });

  final List<EmbeddedResource> embeddedResources;
  final ObjectCallback<List<EmbeddedResource>> callback;
  final bool isPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isPicker
          ? AppBar(
              title: Text(
                'Embedded resources',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BorderContainer(
          title: 'List of embedded resources',
          trailing: InkWell(
            onTap: () => _addEmbeddedPage(context),
            child: const Icon(Icons.add),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...embeddedResources.map((action) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    onTap: isPicker
                        ? () => Navigator.of(context).pop(action)
                        : () => _previewEmbeddedPage(context, action),
                    leading: const Icon(Icons.data_array),
                    title: Text(action.toolbar.titleL10n.toString()),
                    subtitle: Text('Type: ${action.toolbar.titleL10n}'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'delete') {
                          final updatedEmbedded = List<EmbeddedResource>.from(embeddedResources)..remove(action);
                          callback(updatedEmbedded);
                        }
                        if (value == 'edit') {
                          _editEmbeddedPage(context, action);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addEmbeddedPage(BuildContext context) async {
    final res = await GoRouter.of(context).pushNamed<EmbeddedResource>(
      SchemeRoute.appFeatureSchemeAddEmbeddedData.name,
    );
    if (res != null) {
      callback([...embeddedResources, res]);
    }
  }

  Future<void> _editEmbeddedPage(BuildContext context, EmbeddedResource embedded) async {
    final res = await GoRouter.of(context).pushNamed<EmbeddedResource>(
      SchemeRoute.appFeatureSchemeAddEmbeddedData.name,
      extra: embedded,
    );
    if (res != null) {
      final updatedEmbedded = List<EmbeddedResource>.from(embeddedResources)
        ..remove(embedded)
        ..add(res);
      callback(updatedEmbedded);
    }
  }

  Future<void> _previewEmbeddedPage(BuildContext context, EmbeddedResource embedded) async {
    unawaited(GoRouter.of(context).pushNamed<EmbeddedResource>(
      SchemeRoute.appFeatureSchemePreviewEmbeddedData.name,
      extra: embedded,
    ));
  }
}
