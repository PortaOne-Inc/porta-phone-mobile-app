import 'package:flutter/material.dart';

/// Rendering fidelity of the theme preview surface.
///
/// The three modes trade fidelity for cost: [static] and [semiDynamic] both
/// render the lightweight `Screenshot` widgets from the `screenshots` package,
/// while [realtime] mounts the actual `webtrit_phone` application in-process so
/// navigation, gestures and live state react to the edited theme.
enum PreviewMode {
  /// Non-interactive snapshots — one screenshot per screen variant, pointer
  /// input ignored. Closest to the old static mockups.
  static,

  /// Interactive snapshots — duplicate variants collapse into single switchable
  /// screens whose controls react to pointer input, but there is no real routing.
  semiDynamic,

  /// The real `webtrit_phone` app running in-process: live navigation, gestures
  /// and state, all driven by the currently edited theme.
  realtime;

  /// Whether the screenshot builder should emit interactive, collapsed screens.
  bool get isInteractive => this == PreviewMode.semiDynamic;

  /// Whether this mode mounts the real application instead of screenshots.
  bool get isRealtime => this == PreviewMode.realtime;

  String get label => switch (this) {
    PreviewMode.static => 'Static',
    PreviewMode.semiDynamic => 'Semi-dynamic',
    PreviewMode.realtime => 'Realtime',
  };

  String get tooltip => switch (this) {
    PreviewMode.static => 'Static mockups — non-interactive screen snapshots',
    PreviewMode.semiDynamic => 'Semi-dynamic — interactive screen snapshots without real routing',
    PreviewMode.realtime => 'Realtime — the live app running in-process',
  };

  IconData get icon => switch (this) {
    PreviewMode.static => Icons.image_outlined,
    PreviewMode.semiDynamic => Icons.touch_app_outlined,
    PreviewMode.realtime => Icons.play_circle_outline,
  };
}
