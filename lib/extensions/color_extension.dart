import 'dart:ui';

extension ExtensionHexColor on Color {
  /// Converts a [Color] to its hex representation.
  ///
  /// - If [leadingHashSign] is `true`, a `#` is prefixed (default: `true`).
  /// - If [includeAlpha] is `true`, the alpha channel is included (default: `false`).
  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) {
    int to255(double v) => (v * 255.0).round() & 0xff;

    final components = <int>[
      if (includeAlpha) to255(a),
      to255(r),
      to255(g),
      to255(b),
    ];

    final hexColor = components
        .map((c) => c.toRadixString(16).padLeft(2, '0'))
        .join();

    return (leadingHashSign ? '#$hexColor' : hexColor).toUpperCase();
  }
}
