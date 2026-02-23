import 'package:injectable/injectable.dart';
import 'package:data/mappers/mappers.dart';

import 'package:domain/domain.dart' as d;
import 'package:data/dto/assets/launch_assets_dto.dart';

import '../../dto/assets/assets.dart';

@injectable
class FitPaddingMapper extends CommonMapper<d.FitPaddingModel, FitPaddingDto> {
  FitPaddingMapper(this.fitMapper);

  final LaunchFitMapper fitMapper;

  @override
  FitPaddingDto convertTo(d.FitPaddingModel it) => FitPaddingDto(
    fit: it.fit != null ? fitMapper.convertTo(it.fit!) : null,
    paddingDp: it.paddingDp,
  );

  @override
  d.FitPaddingModel convertFrom(FitPaddingDto it) => d.FitPaddingModel(
    fit: it.fit != null ? fitMapper.convertFrom(it.fit!) : null,
    paddingDp: it.paddingDp,
  );
}

@injectable
class PlatformParamsMapper
    extends CommonMapper<d.PlatformParamsModel, PlatformParamsDto> {
  PlatformParamsMapper(this.slice);

  final FitPaddingMapper slice;

  @override
  PlatformParamsDto convertTo(d.PlatformParamsModel it) => PlatformParamsDto(
    androidLegacy: it.androidLegacy != null
        ? slice.convertTo(it.androidLegacy!)
        : null,
    androidAdaptive: it.androidAdaptive != null
        ? slice.convertTo(it.androidAdaptive!)
        : null,
    ios: it.ios != null ? slice.convertTo(it.ios!) : null,
    web: it.web != null ? slice.convertTo(it.web!) : null,
  );

  @override
  d.PlatformParamsModel convertFrom(PlatformParamsDto it) =>
      d.PlatformParamsModel(
        androidLegacy: it.androidLegacy != null
            ? slice.convertFrom(it.androidLegacy!)
            : null,
        androidAdaptive: it.androidAdaptive != null
            ? slice.convertFrom(it.androidAdaptive!)
            : null,
        ios: it.ios != null ? slice.convertFrom(it.ios!) : null,
        web: it.web != null ? slice.convertFrom(it.web!) : null,
      );
}

@injectable
class SourceConfigMapper
    extends CommonMapper<d.SourceConfigModel, SourceConfigDto> {
  @override
  SourceConfigDto convertTo(d.SourceConfigModel it) => SourceConfigDto(
    foregroundAssetId: it.foregroundAssetId,
    backgroundAssetId: it.backgroundAssetId,
    backgroundColorHex: it.backgroundColorHex,
  );

  @override
  d.SourceConfigModel convertFrom(SourceConfigDto it) => d.SourceConfigModel(
    foregroundAssetId: it.foregroundAssetId,
    backgroundAssetId: it.backgroundAssetId,
    backgroundColorHex: it.backgroundColorHex,
  );
}

@injectable
class OutputArtifactsMapper
    extends CommonMapper<d.OutputArtifactsModel, OutputArtifactsDto> {
  @override
  OutputArtifactsDto convertTo(d.OutputArtifactsModel it) => OutputArtifactsDto(
    androidLegacyArtifactId: it.androidLegacyArtifactId,
    androidAdaptiveForegroundArtifactId: it.androidAdaptiveForegroundArtifactId,
    androidAdaptiveBackgroundArtifactId: it.androidAdaptiveBackgroundArtifactId,
    iosArtifactId: it.iosArtifactId,
    webArtifactId: it.webArtifactId,
  );

  @override
  d.OutputArtifactsModel convertFrom(
    OutputArtifactsDto it,
  ) => d.OutputArtifactsModel(
    androidLegacyArtifactId: it.androidLegacyArtifactId,
    androidAdaptiveForegroundArtifactId: it.androidAdaptiveForegroundArtifactId,
    androidAdaptiveBackgroundArtifactId: it.androidAdaptiveBackgroundArtifactId,
    iosArtifactId: it.iosArtifactId,
    webArtifactId: it.webArtifactId,
  );
}

@injectable
class LaunchAssetsMapper
    extends CommonMapper<d.LaunchAssetsModel, LaunchAssetsDto> {
  LaunchAssetsMapper(this.source, this.params, this.outputsArtifacts);

  final SourceConfigMapper source;
  final PlatformParamsMapper params;
  final OutputArtifactsMapper outputsArtifacts;

  @override
  LaunchAssetsDto convertTo(d.LaunchAssetsModel it) => LaunchAssetsDto(
    id: it.id,
    applicationId: it.applicationId,
    themeId: it.themeId,
    source: it.source != null ? source.convertTo(it.source!) : null,
    params: it.params != null ? params.convertTo(it.params!) : null,
    outputsArtifacts: it.outputsArtifacts != null
        ? outputsArtifacts.convertTo(it.outputsArtifacts!)
        : null,
    createdAt: it.createdAt.toUtc().toIso8601String(),
    updatedAt: it.updatedAt.toUtc().toIso8601String(),
  );

  @override
  d.LaunchAssetsModel convertFrom(LaunchAssetsDto it) => d.LaunchAssetsModel(
    id: it.id,
    applicationId: it.applicationId,
    themeId: it.themeId,
    source: it.source != null ? source.convertFrom(it.source!) : null,
    params: it.params != null ? params.convertFrom(it.params!) : null,
    outputsArtifacts: it.outputsArtifacts != null
        ? outputsArtifacts.convertFrom(it.outputsArtifacts!)
        : null,
    createdAt: DateTime.parse(it.createdAt).toUtc(),
    updatedAt: DateTime.parse(it.updatedAt).toUtc(),
  );
}

@injectable
class ValidationSliceMapper
    extends CommonMapper<d.ValidationSlice, ValidationSliceDto> {
  @override
  ValidationSliceDto convertTo(d.ValidationSlice it) => ValidationSliceDto(
    compliant: it.compliant,
    deltaDp: it.deltaDp,
    message: it.message,
  );

  @override
  d.ValidationSlice convertFrom(ValidationSliceDto it) => d.ValidationSlice(
    compliant: it.compliant,
    deltaDp: it.deltaDp,
    message: it.message,
  );
}

@injectable
class ValidationReportMapper
    extends CommonMapper<d.ValidationReport, ValidationReportDto> {
  ValidationReportMapper(this.slice);

  final ValidationSliceMapper slice;

  @override
  ValidationReportDto convertTo(d.ValidationReport it) => ValidationReportDto(
    androidLegacy: it.androidLegacy != null
        ? slice.convertTo(it.androidLegacy!)
        : null,
    androidAdaptive: it.androidAdaptive != null
        ? slice.convertTo(it.androidAdaptive!)
        : null,
    ios: it.ios != null ? slice.convertTo(it.ios!) : null,
    web: it.web != null ? slice.convertTo(it.web!) : null,
  );

  @override
  d.ValidationReport convertFrom(ValidationReportDto it) => d.ValidationReport(
    androidLegacy: it.androidLegacy != null
        ? slice.convertFrom(it.androidLegacy!)
        : null,
    androidAdaptive: it.androidAdaptive != null
        ? slice.convertFrom(it.androidAdaptive!)
        : null,
    ios: it.ios != null ? slice.convertFrom(it.ios!) : null,
    web: it.web != null ? slice.convertFrom(it.web!) : null,
  );
}

@injectable
class LaunchAssetsEnvelopeMapper
    extends CommonMapper<d.LaunchAssetsEnvelope, LaunchAssetsEnvelopeDto> {
  LaunchAssetsEnvelopeMapper(this.entity, this.validation);

  final LaunchAssetsMapper entity;
  final ValidationReportMapper validation;

  @override
  LaunchAssetsEnvelopeDto convertTo(d.LaunchAssetsEnvelope it) =>
      LaunchAssetsEnvelopeDto(
        entity: entity.convertTo(it.entity),
        urls: it.urls,
        validation: it.validation != null
            ? validation.convertTo(it.validation!)
            : null,
      );

  @override
  d.LaunchAssetsEnvelope convertFrom(LaunchAssetsEnvelopeDto it) =>
      d.LaunchAssetsEnvelope(
        entity: entity.convertFrom(it.entity),
        urls: it.urls,
        validation: it.validation != null
            ? validation.convertFrom(it.validation!)
            : null,
      );
}
