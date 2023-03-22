import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/share/share.dart';

class VendorPreviewItem extends StatelessWidget {
  const VendorPreviewItem({
    super.key,
    required this.application,
    required this.onDelete,
    required this.onEdit,
    required this.onOpen,
  });

  final ApplicationModel application;

  final Function(ApplicationModel model) onOpen;
  final Function(ApplicationModel model) onDelete;
  final Function(ApplicationModel model) onEdit;

  static const _menuKeyEdit = '_menuKeyEdit';
  static const _menuKeyDelete = '_menuKeyDelete';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onOpen.call(application),
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    application.title ?? context.l10n.common_text_undefine,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  PopupMenuButton(
                    offset: const Offset(0, 32),
                    elevation: 6,
                    onSelected: _handleMenuTab,
                    padding: const EdgeInsets.only(top: 8),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (c) => [
                      PopupMenuItem(
                        value: _menuKeyEdit,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context.l10n.feature_vendor_collection_VendorPreviewItem_edit,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      PopupMenuItem(
                        value: _menuKeyDelete,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context.l10n.feature_vendor_collection_VendorPreviewItem_delete,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                application.description ?? context.l10n.common_text_undefine,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                child: Tooltip(
                  message: application.id,
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    application.uuid,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.green),
                  ),
                ),
                onTap: () => _showCopyInBufferMessage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCopyInBufferMessage(BuildContext context) {
    Clipboard.setData(ClipboardData(text: application.id)).then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              application.uuid,
            ),
          ),
        );
      },
    );
  }

  void _handleMenuTab(String key) {
    switch (key) {
      case _menuKeyDelete:
        onDelete.call(application);
        break;
      case _menuKeyEdit:
        onEdit.call(application);
        break;
    }
  }
}
