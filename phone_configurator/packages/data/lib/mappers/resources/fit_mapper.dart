import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../../dto/assets/assets.dart';
import '../mapper.dart';

@injectable
class LaunchFitMapper extends CommonMapper<FitModel, FitDto> {
  @override
  FitDto convertTo(FitModel it) => FitDto.values[it.index];

  @override
  FitModel convertFrom(FitDto it) => FitModel.values[it.index];
}
