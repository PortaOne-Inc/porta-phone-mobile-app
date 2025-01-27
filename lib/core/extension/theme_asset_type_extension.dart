import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

extension ThemeAssetTypeIcon on ThemeAssetType {
  IconData get icon {
    switch (this) {
      case ThemeAssetType.image:
        return Icons.image;
      case ThemeAssetType.html:
        return Icons.web;
      case ThemeAssetType.unknown:
        return Icons.help_outline;
    }
  }
}
