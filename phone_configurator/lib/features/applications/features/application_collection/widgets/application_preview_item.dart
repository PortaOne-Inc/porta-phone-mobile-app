import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class ApplicationPreviewItem extends StatelessWidget {
  const ApplicationPreviewItem({
    required this.application,
    required this.onDelete,
    required this.onEdit,
    required this.onOpen,
    required this.incrementVersion,
    super.key,
  });

  final ApplicationModel application;

  final void Function(ApplicationModel model) onOpen;
  final void Function(ApplicationModel model) onDelete;
  final void Function(ApplicationModel model) onEdit;
  final void Function(ApplicationModel model) incrementVersion;

  static const _menuKeyEdit = '_menuKeyEdit';
  static const _menuKeyUpdateVersion = '_menuKeyUpdateVersion';
  static const _menuKeyDelete = '_menuKeyDelete';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onOpen.call(application),
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      application.name ?? context.l10n.common_text_undefine,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  PopupMenuButton(
                    offset: const Offset(0, 32),
                    elevation: 6,
                    onSelected: _handleMenuTab,
                    padding: const EdgeInsets.only(top: 8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (c) => [
                      PopupMenuItem(
                        value: _menuKeyUpdateVersion,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context.l10n.feature_applications_Menu_increment,
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      PopupMenuItem(
                        value: _menuKeyEdit,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context
                              .l10n
                              .feature_application_collection_ApplicationPreviewItem_edit,
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      PopupMenuItem(
                        value: _menuKeyDelete,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context
                              .l10n
                              .feature_application_collection_ApplicationPreviewItem_delete,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuTab(String key) {
    switch (key) {
      case _menuKeyDelete:
        onDelete.call(application);
      case _menuKeyEdit:
        onEdit.call(application);
      case _menuKeyUpdateVersion:
        incrementVersion.call(application);
    }
  }
}
