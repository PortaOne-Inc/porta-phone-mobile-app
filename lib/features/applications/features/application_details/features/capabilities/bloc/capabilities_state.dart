part of 'capabilities_cubit.dart';

/// Minimal model: key, title, enabled (no groups, no defaults)
class Capability {
  Capability({required this.key, required this.title, required this.enabled});

  final String key; // e.g. "messaging"
  final String title; // l10n-resolved label
  final bool enabled;

  Capability copyWith({String? key, String? title, bool? enabled}) =>
      Capability(
        key: key ?? this.key,
        title: title ?? this.title,
        enabled: enabled ?? this.enabled,
      );
}

@freezed
class CapabilitiesState with _$CapabilitiesState {
  const factory CapabilitiesState.initial() = _Initial;

  const factory CapabilitiesState.loading() = _Loading;

  const factory CapabilitiesState.ready({
    required List<Capability> capabilities,
    @Default(false) bool dirty,
    @Default('') String query,
  }) = _Ready;

  const factory CapabilitiesState.failure(String message) = _Failure;
}
