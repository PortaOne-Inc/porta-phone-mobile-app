import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'application_build_version_progress.freezed.dart';

@freezed
sealed class ApplicationBuildVersionProgress
    with _$ApplicationBuildVersionProgress {
  const factory ApplicationBuildVersionProgress({
    required List<BuildPlatform> progressNameUpdating,
    required List<BuildPlatform> progressNumberUpdating,
  }) = _ApplicationBuildVersionProgress;

  const ApplicationBuildVersionProgress._();

  bool isNameProgress(BuildPlatform platform) {
    return progressNameUpdating.contains(platform);
  }

  bool isNumberProgress(BuildPlatform platform) {
    return progressNumberUpdating.contains(platform);
  }
}
