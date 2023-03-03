import 'package:injectable/injectable.dart';

import '../../../dto/dto.dart';
import '../../../models/theme/theme.dart';
import '../../mapper.dart';

@Injectable(as: Mapper<ColorDTO, ColorsModel>)
class ColorsMapper extends Mapper<ColorDTO, ColorsModel> {
  final int _whiteColor = 4294967295;

  @override
  ColorDTO mapToDto(ColorsModel model) {
    return ColorDTO(
      primary: model.primary,
      onPrimary: model.onPrimary,
      secondary: model.secondary,
      secondaryContainer: model.secondaryContainer,
      onSecondaryContainer: model.onSecondaryContainer,
      tertiary: model.tertiary,
      error: model.error,
      outline: model.outline,
      background: model.background,
      onBackground: model.onBackground,
      surface: model.surface,
      onSurface: model.onSurface,
      gradientTabColor: model.gradientTabColor,
    );
  }

  @override
  ColorsModel mapToModel(ColorDTO dto) {
    return ColorsModel(
      primary: dto.primary ?? _whiteColor,
      onPrimary: dto.onPrimary ?? _whiteColor,
      secondary: dto.secondary ?? _whiteColor,
      secondaryContainer: dto.secondaryContainer ?? _whiteColor,
      onSecondaryContainer: dto.onSecondaryContainer ?? _whiteColor,
      tertiary: dto.tertiary ?? _whiteColor,
      error: dto.error ?? _whiteColor,
      outline: dto.outline ?? _whiteColor,
      background: dto.background ?? _whiteColor,
      onBackground: dto.onBackground ?? _whiteColor,
      surface: dto.surface ?? _whiteColor,
      onSurface: dto.onSurface ?? _whiteColor,
      gradientTabColor: dto.gradientTabColor ?? [_whiteColor, _whiteColor],
    );
  }
}
