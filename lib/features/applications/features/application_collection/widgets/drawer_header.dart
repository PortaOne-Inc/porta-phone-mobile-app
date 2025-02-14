import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:domain/domain.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    required this.user,
    super.key,
  });

  final UserMetadata? user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ListTile(
          title: const Text('ID'),
          subtitle: Text('${user?.id}'),
        ),
        ListTile(
          title: const Text('Email'),
          subtitle: Text('${user?.email}'),
        ),
        if (user?.jwtToken != null)
          ListTile(
            title: const Text('JWT'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                if (user!.jwtToken.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: user!.jwtToken));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('JWT copied to clipboard')),
                  );
                }
              },
            ),
            subtitle: Text(
              user!.jwtToken,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
