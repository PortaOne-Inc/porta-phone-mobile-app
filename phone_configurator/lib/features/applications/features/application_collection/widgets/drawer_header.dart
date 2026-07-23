import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({required this.user, super.key});

  final UserMetadata? user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const VersionInfo(),
        _ListTileWidget(title: 'ID', subtitle: user?.id),
        _ListTileWidget(title: 'Email', subtitle: user?.email),
        if (user?.jwtToken != null)
          _JwtTileWidget(user: user!, textTheme: textTheme),
        if (user?.expiredTime != null)
          _ListTileWidget(
            title: 'Expired At',
            subtitle: user?.expiredTime?.toIso8601String(),
          ),
      ],
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({required this.title, required this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), subtitle: Text(subtitle ?? ''));
  }
}

class _JwtTileWidget extends StatelessWidget {
  const _JwtTileWidget({required this.user, required this.textTheme});

  final UserMetadata user;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('JWT'),
      trailing: IconButton(
        icon: const Icon(Icons.copy),
        onPressed: () {
          if (user.jwtToken.isNotEmpty) {
            Clipboard.setData(ClipboardData(text: user.jwtToken));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('JWT copied to clipboard')),
            );
          }
        },
      ),
      subtitle: Text(
        user.jwtToken,
        overflow: TextOverflow.ellipsis,
        style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
