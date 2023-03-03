import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

class VendorEmptyView extends StatelessWidget {
  const VendorEmptyView({
    super.key,
    required this.visibility,
  });

  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            context.l10n.feature_vendor_create_Text_no_vendors_yet,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.deepPurple,
                ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
