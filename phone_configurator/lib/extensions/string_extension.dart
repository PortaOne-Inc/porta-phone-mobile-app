import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  /// Converts a CSS hex string to a [Color].
  ///
  /// Supports formats:
  /// * `#RGB` -> `0xFFRRGGBB`
  /// * `#ARGB` -> `0xAARRGGBB`
  /// * `#RRGGBB` -> `0xFFRRGGBB`
  /// * `#AARRGGBB` -> `0xAARRGGBB`
  ///
  /// If [returnNullOnFailure] is `true`, returns `null` instead of throwing
  /// a [FormatException] when the format is invalid.
  Color? tryParseColor({bool returnNullOnFailure = false}) {
    try {
      if (!startsWith('#')) {
        throw const FormatException('Incorrect CSS hexadecimal color prefix');
      }

      var hex = substring(1);

      // Normalize to 8 chars (AARRGGBB)
      if (hex.length == 3) {
        final r = hex[0];
        final g = hex[1];
        final b = hex[2];
        hex = 'FF$r$r$g$g$b$b';
      } else if (hex.length == 4) {
        final a = hex[0];
        final r = hex[1];
        final g = hex[2];
        final b = hex[3];
        hex = '$a$a$r$r$g$g$b$b';
      } else if (hex.length == 6) {
        hex = 'FF$hex';
      } else if (hex.length != 8) {
        throw const FormatException('Incorrect CSS hexadecimal color length');
      }

      return Color(int.parse(hex, radix: 16));
    } catch (_) {
      if (returnNullOnFailure) return null;
      rethrow;
    }
  }

  /// Tries to parse the string as a URI and launch it.
  /// Returns true if successful, false otherwise.
  Future<bool> launchAsUrl() async {
    try {
      final uri = Uri.tryParse(this);

      if (uri != null && await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      }

      log('Could not launch URL: $this');
      return false;
    } catch (e) {
      log('Error launching URL: $e');
      return false;
    }
  }
}
