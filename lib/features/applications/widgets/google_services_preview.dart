import 'package:flutter/material.dart';

class GoogleServicesPreview extends StatelessWidget {
  const GoogleServicesPreview({
    super.key,
    required this.platform,
    this.isAttached = true,
    required this.onTap,
  });

  final TargetPlatform platform;
  final bool isAttached;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: isAttached ? Colors.red.withOpacity(0.2) : Colors.green.withOpacity(0.2),
      onTap: () => onTap(),
      child: Card(
        child: SizedBox(
            width: 168,
            height: 134,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          isAttached ? 'Google services config' : _getPlatformNameFile(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                isAttached
                    ? Icon(Icons.remove_circle_outlined, color: Theme.of(context).colorScheme.error)
                    : Icon(Icons.add_outlined, color: Theme.of(context).colorScheme.tertiary),
                const SizedBox(height: 8),
              ],
            )),
      ),
    );
  }

  String _getPlatformNameFile() {
    switch (platform) {
      case TargetPlatform.android:
        return 'google-services.json';
      case TargetPlatform.iOS:
        return 'GoogleService-Info.plist';
      default:
        return 'Google services config';
    }
  }
}
