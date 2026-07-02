import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common/api_exception_mapper.dart';
import '../datasource/configurator_backend/configurator_backand_datasource.dart';
import '../dto/theme/color_scheme_dto.dart';
import '../mappers/mapper.dart';

@Injectable(as: ColorSchemeRepository)
class ColorSchemeRepositoryImpl extends ColorSchemeRepository {
  ColorSchemeRepositoryImpl(this._api, this._mapper);

  final ConfiguratorBackandDatasource _api;
  final CommonMapper<ColorSchemeModel, ColorSchemeDto> _mapper;

  @override
  Future<ColorSchemeModel> getByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  }) => guardApiCall(() async {
    final dto = await _api.getColorSchemeByVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant.name,
    );
    return _mapper.convertFrom(dto);
  });

  @override
  Future<List<ColorSchemeModel>> listForTheme({required String applicationId, required String themeId}) =>
      guardApiCall(() async {
        final list = await _api.listColorSchemes(applicationId: applicationId, themeId: themeId);
        return list.nonNulls.map(_mapper.convertFrom).toList().nonNulls.toList();
      });

  @override
  Future<(ColorSchemeModel light, ColorSchemeModel dark)> ensurePair({
    required String applicationId,
    required String themeId,
  }) => guardApiCall(() async {
    final list = await _api.ensurePair(applicationId: applicationId, themeId: themeId);
    final models = list.map(_mapper.convertFrom).toList();

    ColorSchemeModel? light;
    ColorSchemeModel? dark;

    for (final m in models) {
      if (m.variant == BrightnessVariant.light) light = m;
      if (m.variant == BrightnessVariant.dark) dark = m;
    }
    if (light == null || dark == null) {
      throw BaseException(message: 'ensurePair: server did not return both variants');
    }
    return (light, dark);
  });

  @override
  Future<ColorSchemeModel> upsertByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) => guardApiCall(() async {
    final dto = await _api.upsertVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant.name,
      config: config,
      expectedVersion: expectedVersion,
    );
    return _mapper.convertFrom(dto);
  });
}
