import 'dart:typed_data';

import '../../models/models.dart';

abstract class LaunchAssetsRepository {
  Future<LaunchAssetsEnvelope> getByTheme({
    required String applicationId,
    required String themeId,
    bool includeUrl = false,
    int? urlTtlSec,
    bool withValidation = false,
  });

  Future<LaunchAssetsModel> upsertWithFilesByTheme({
    required String applicationId,
    required String themeId,
    required List<LaunchArtifactUpload> uploads,
    SourceConfigModel? source,
    PlatformParamsModel? params,
  });

  Future<void> deleteByTheme({
    required String applicationId,
    required String themeId,
  });

  Future<ConstraintsModel> getConstraintsDefaults();
}

enum LaunchOutputTarget {
  androidLegacy,
  androidAdaptiveForeground,
  androidAdaptiveBackground,
  ios,
  web,
}

class LaunchArtifactUpload {
  LaunchArtifactUpload({
    required this.target,
    required this.mimeType,
    required this.bytes,
  });

  final LaunchOutputTarget target;
  final String mimeType;
  final Uint8List bytes;
}
