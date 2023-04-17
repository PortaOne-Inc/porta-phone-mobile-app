import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/share/widgets/widgets.dart';

class CredentialToolbar extends StatelessWidget {
  const CredentialToolbar({
    super.key,
    required this.userId,
    required this.themeId,
    required this.vendorId,
  });

  final String userId;
  final String themeId;
  final String vendorId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: const Text('Credentials'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Flexible(
                child: Text('User id:'),
              ),
              Flexible(
                child: GestureDetector(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: userId,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 8,
                          ),
                        ),
                        WidgetSpan(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(
                              Icons.copy,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Clipboard.setData(
                    ClipboardData(
                      text: userId,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Flexible(
                child: Text('Vendor id:'),
              ),
              Flexible(
                child: GestureDetector(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: vendorId,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 8,
                          ),
                        ),
                        WidgetSpan(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(
                              Icons.copy,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Clipboard.setData(ClipboardData(text: vendorId)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Flexible(
                child: Text('Theme id:'),
              ),
              Flexible(
                child: GestureDetector(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: themeId,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            width: 8,
                          ),
                        ),
                        WidgetSpan(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(
                              Icons.copy,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Clipboard.setData(ClipboardData(text: themeId)),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Button(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: 'OK',
        ),
      ],
    );
  }
}
