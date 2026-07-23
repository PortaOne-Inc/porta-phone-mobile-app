import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_build_platform.freezed.dart';

const _kPlatformAndroidKey = 'android';
const _kPlatformIOSKey = 'ios';

const _kPlayStoreTrackProduction = 'production';
const _kPlayStoreTrackBeta = 'beta';
const _kPlayStoreTrackAlpha = 'alpha';
const _kPlayStoreTrackInternal = 'internal';

const _kPlayStoreStatusCompleted = 'completed';
const _kPlayStoreStatusInProgress = 'inProgress';
const _kPlayStoreStatusHalted = 'halted';
const _kPlayStoreStatusDraft = 'draft';

const _kPlayStoreUserFractionMax = 0.99;

@freezed
sealed class AndroidBuildPlatform with _$AndroidBuildPlatform {
  const factory AndroidBuildPlatform({
    @Default(_kPlatformAndroidKey) String key,
    @Default(false) bool deploy,
    @Default(
      AndroidPlayStoreConfig(
        track: _kPlayStoreTrackBeta,
        status: _kPlayStoreStatusDraft,
        updatePriority: 0,
        userFraction: _kPlayStoreUserFractionMax,
      ),
    )
    AndroidPlayStoreConfig playStoreConfig,
  }) = _AndroidBuildPlatform;

  const AndroidBuildPlatform._();

  AndroidBuildPlatform copyWithPlayStoreConfig(
    AndroidPlayStoreConfig? playStoreConfig,
  ) {
    return copyWith(playStoreConfig: playStoreConfig ?? this.playStoreConfig);
  }

  AndroidBuildPlatform? normalize() {
    if (!deploy) return null;

    final isUserFractionAvailable = playStoreConfig.isUserFractionAvailable;
    final userFraction = playStoreConfig.userFraction;

    return copyWith(
      playStoreConfig: playStoreConfig.copyWith(
        userFraction: isUserFractionAvailable
            ? userFraction ?? _kPlayStoreUserFractionMax
            : null,
      ),
    );
  }
}

@freezed
sealed class IOSBuildPlatform with _$IOSBuildPlatform {
  const factory IOSBuildPlatform({
    @Default(_kPlatformIOSKey) String key,
    @Default(false) bool deploy,
  }) = _IOSBuildPlatform;

  const IOSBuildPlatform._();
}

@freezed
sealed class AndroidPlayStoreConfig with _$AndroidPlayStoreConfig {
  const factory AndroidPlayStoreConfig({
    required String track,
    required String status,
    required int updatePriority,
    double? userFraction,
  }) = _AndroidPlayStoreConfig;

  const AndroidPlayStoreConfig._();

  List<String> get availableTracks => [
    _kPlayStoreTrackProduction,
    _kPlayStoreTrackBeta,
    _kPlayStoreTrackAlpha,
    _kPlayStoreTrackInternal,
  ];

  List<String> get availableStatuses => [
    _kPlayStoreStatusCompleted,
    _kPlayStoreStatusInProgress,
    _kPlayStoreStatusHalted,
    _kPlayStoreStatusDraft,
  ];

  List<String> get unavailableUserFractionStatuses => [
    _kPlayStoreStatusCompleted,
    _kPlayStoreStatusDraft,
  ];

  bool get isUserFractionAvailable =>
      !unavailableUserFractionStatuses.contains(status);
}
