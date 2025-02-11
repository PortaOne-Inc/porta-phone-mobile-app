import 'dart:ui';

extension ExtensionHexColor on Color {
  /// Converts a [Color] to its hex representation.
  ///
  /// - If [leadingHashSign] is `true`, a `#` is prefixed (default: `true`).
  /// - If [includeAlpha] is `true`, the alpha channel is included (default: `false`).
  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) {
    final hexColor = [if (includeAlpha) alpha, red, green, blue].map((c) => c.toRadixString(16).padLeft(2, '0')).join();

    return (leadingHashSign ? '#$hexColor' : hexColor).toUpperCase();
  }
}
