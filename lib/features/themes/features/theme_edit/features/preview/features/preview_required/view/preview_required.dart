import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/models/models.dart';

class PreviewRequired extends StatelessWidget {
  const PreviewRequired({required this.exception, super.key});

  final Object exception;

  String _getErrorMessage(Object exception) {
    return exception.toString();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final errorMessage = _getErrorMessage(exception);

    final isEmbeddedResourceMissingException =
        exception is EmbeddedResourceMissingException;
    const borderSide = BorderSide(width: 0.1, color: Colors.black87);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ConfiguratorGroupTitleTile(
            titleData:
                'Preview is not available till the required data is provided',
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(border: Border(bottom: borderSide)),
          ),
          if (isEmbeddedResourceMissingException)
            EmbeddedResourceMissingView(
              exception: exception as EmbeddedResourceMissingException,
            ),
          if (!isEmbeddedResourceMissingException)
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: textTheme.labelLarge,
            ),
        ],
      ),
    );
  }
}

class EmbeddedResourceMissingView extends StatelessWidget {
  const EmbeddedResourceMissingView({required this.exception, super.key});

  final EmbeddedResourceMissingException exception;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Missing Embedded Resource',
              style: textTheme.titleMedium?.copyWith(color: colorScheme.error),
            ),
            subtitle: Text.rich(
              TextSpan(
                text: 'The following embedded resource is missing: ',
                style: const TextStyle(fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                    text: exception.embeddedResourceType.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Text('To resolve this issue:'),
            subtitle: Text(
              'Navigate to the Feature Access section and select Embedded Resources to add the missing resource.',
            ),
          ),
        ],
      ),
    );
  }
}
