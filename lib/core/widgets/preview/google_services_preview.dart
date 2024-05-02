import 'package:flutter/material.dart';

enum GoogleServicesPreviewType {
  add,
  remove,
  download,
}

class GoogleServicesPreview extends StatelessWidget {
  const GoogleServicesPreview({
    required this.platform,
    required this.onTap,
    this.type = GoogleServicesPreviewType.add,
    super.key,
  });

  final GoogleServicesPreviewType type;
  final TargetPlatform platform;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168,
      height: 134,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: InkWell(
          hoverColor: _getActiveColor(context).withOpacity(0.1),
          onTap: onTap,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  platform.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        type == GoogleServicesPreviewType.add ? 'Google services config' : _getPlatformNameFile(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Icon(_getActiveIcon(), color: _getActiveColor(context)),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getActiveIcon() {
    switch (type) {
      case GoogleServicesPreviewType.add:
        return Icons.add_outlined;
      case GoogleServicesPreviewType.remove:
        return Icons.remove_circle_outlined;
      case GoogleServicesPreviewType.download:
        return Icons.download;
    }
  }

  Color _getActiveColor(BuildContext context) {
    switch (type) {
      case GoogleServicesPreviewType.add:
        return Theme.of(context).colorScheme.tertiary;
      case GoogleServicesPreviewType.remove:
        return Theme.of(context).colorScheme.error;
      case GoogleServicesPreviewType.download:
        return Theme.of(context).colorScheme.onBackground.withOpacity(0.5);
    }
  }

  String _getPlatformNameFile() {
    if (platform == TargetPlatform.android) return 'google-services.json';
    if (platform == TargetPlatform.iOS) return 'GoogleService-Info.plist';
    return 'Google services config';
  }
}
