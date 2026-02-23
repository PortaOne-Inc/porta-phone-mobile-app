import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';

@Injectable(as: CommonMapper<FitModel, FitDto>)
class SplashFitEnumMapper extends CommonMapper<FitModel, FitDto> {
  @override
  FitDto convertTo(FitModel it) => switch (it) {
    FitModel.contain => FitDto.contain,
    FitModel.cover => FitDto.cover,
    FitModel.fill => FitDto.fill,
    FitModel.none => FitDto.none,
    FitModel.scaleDown => FitDto.scaleDown,
    FitModel.fitWidth => FitDto.fitWidth,
    FitModel.fitHeight => FitDto.fitHeight,
  };

  @override
  FitModel convertFrom(FitDto it) => switch (it) {
    FitDto.contain => FitModel.contain,
    FitDto.cover => FitModel.cover,
    FitDto.fill => FitModel.fill,
    FitDto.none => FitModel.none,
    FitDto.scaleDown => FitModel.scaleDown,
    FitDto.fitWidth => FitModel.fitWidth,
    FitDto.fitHeight => FitModel.fitHeight,
  };
}

@Injectable(as: CommonMapper<SplashAssetParams, SplashAssetParamsDto>)
class SplashAssetParamsMapper
    extends CommonMapper<SplashAssetParams, SplashAssetParamsDto> {
  SplashAssetParamsMapper(this._fitMapper);

  final CommonMapper<FitModel, FitDto> _fitMapper;

  @override
  SplashAssetParamsDto convertTo(SplashAssetParams it) => SplashAssetParamsDto(
    fit: it.fit != null ? _fitMapper.convertTo(it.fit!) : FitDto.scaleDown,
    padding: it.padding ?? 0,
  );

  @override
  SplashAssetParams convertFrom(SplashAssetParamsDto it) => SplashAssetParams(
    fit: it.fit != null ? _fitMapper.convertFrom(it.fit!) : null,
    padding: it.padding ?? it.padding,
  );
}

@Injectable(
  as: CommonMapper<SplashConstraintsValidation, SplashConstraintsValidationDto>,
)
class SplashConstraintsValidationMapper
    extends
        CommonMapper<
          SplashConstraintsValidation,
          SplashConstraintsValidationDto
        > {
  @override
  SplashConstraintsValidationDto convertTo(SplashConstraintsValidation it) =>
      SplashConstraintsValidationDto(
        compliant: it.compliant,
        deltaDp: it.delta,
        message: it.message,
        toleranceDp: it.tolerance,
      );

  @override
  SplashConstraintsValidation convertFrom(SplashConstraintsValidationDto it) =>
      SplashConstraintsValidation(
        compliant: it.compliant,
        delta: it.deltaDp,
        message: it.message,
        tolerance: it.toleranceDp,
      );
}

@Injectable(as: CommonMapper<SplashIconConstraints, SplashIconConstraintsDto>)
class SplashIconConstraintsMapper
    extends CommonMapper<SplashIconConstraints, SplashIconConstraintsDto> {
  SplashIconConstraintsMapper(this._valMapper);

  final CommonMapper<
    SplashConstraintsValidation,
    SplashConstraintsValidationDto
  >
  _valMapper;

  SplashMode _fromDtoMode(SplashModeDto v) =>
      v == SplashModeDto.withoutBackground
      ? SplashMode.withoutBackground
      : SplashMode.withBackground;

  SplashModeDto _toDtoMode(SplashMode v) => v == SplashMode.withoutBackground
      ? SplashModeDto.withoutBackground
      : SplashModeDto.withBackground;

  @override
  SplashIconConstraintsDto convertTo(SplashIconConstraints it) =>
      SplashIconConstraintsDto(
        mode: it.mode != null
            ? _toDtoMode(it.mode!)
            : SplashModeDto.withBackground,
        fullSizeDp: it.fullSize,
        maskDiameterDp: it.maskDiameter,
        recommendedPaddingDp: it.recommendedPadding,
        recommendationBasis: it.recommendationBasis ?? 'safeZone',
        validation: _valMapper.convertTo(it.validation),
      );

  @override
  SplashIconConstraints convertFrom(SplashIconConstraintsDto it) =>
      SplashIconConstraints(
        mode: _fromDtoMode(it.mode),
        fullSize: it.fullSizeDp,
        maskDiameter: it.maskDiameterDp,
        recommendedPadding: it.recommendedPaddingDp,
        recommendationBasis: it.recommendationBasis.isNotEmpty
            ? it.recommendationBasis
            : null,
        validation: _valMapper.convertFrom(it.validation),
      );
}

@Injectable(as: CommonMapper<SplashAssetModel, SplashAssetDto>)
class SplashAssetMapper extends CommonMapper<SplashAssetModel, SplashAssetDto> {
  SplashAssetMapper(this._params, this._constraints);

  final CommonMapper<SplashAssetParams, SplashAssetParamsDto> _params;
  final CommonMapper<SplashIconConstraints, SplashIconConstraintsDto>
  _constraints;

  SplashMode? _fromDtoModeNullable(SplashModeDto? v) => v == null
      ? null
      : (v == SplashModeDto.withoutBackground
            ? SplashMode.withoutBackground
            : SplashMode.withBackground);

  SplashModeDto? _toDtoModeNullable(SplashMode? v) => v == null
      ? null
      : (v == SplashMode.withoutBackground
            ? SplashModeDto.withoutBackground
            : SplashModeDto.withBackground);

  @override
  SplashAssetDto convertTo(SplashAssetModel it) => SplashAssetDto(
    id: it.id,
    applicationId: it.applicationId,
    themeId: it.themeId,
    mode: _toDtoModeNullable(it.mode),
    splashArtifactId: it.splashArtifactId,
    source: it.source != null
        ? SplashSourceDto(
            foregroundAssetId: it.source!.foregroundAssetId,
            backgroundAssetId: it.source!.backgroundAssetId,
            backgroundColorHex: it.source!.backgroundColorHex,
          )
        : null,
    params: it.params != null ? _params.convertTo(it.params!) : null,
    iconConstraints: it.iconConstraints != null
        ? _constraints.convertTo(it.iconConstraints!)
        : null,
    createdAt: it.createdAt,
    updatedAt: it.updatedAt,
  );

  @override
  SplashAssetModel convertFrom(SplashAssetDto it) => SplashAssetModel(
    id: it.id,
    applicationId: it.applicationId,
    themeId: it.themeId,
    mode: _fromDtoModeNullable(it.mode),
    splashArtifactId: it.splashArtifactId,
    android12SplashArtifactId:
        it.outputsArtifacts?.android12SplashArtifactId,
    source: it.source != null
        ? SplashSource(
            foregroundAssetId: it.source!.foregroundAssetId,
            backgroundAssetId: it.source!.backgroundAssetId,
            backgroundColorHex: it.source!.backgroundColorHex,
          )
        : null,
    params: it.params != null ? _params.convertFrom(it.params!) : null,
    iconConstraints: it.iconConstraints != null
        ? _constraints.convertFrom(it.iconConstraints!)
        : null,
    createdAt: it.createdAt ?? '',
    updatedAt: it.updatedAt ?? '',
  );
}
