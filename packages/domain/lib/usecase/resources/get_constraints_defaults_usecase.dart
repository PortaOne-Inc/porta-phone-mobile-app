import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/resources/constraints_model.dart';

abstract class GetConstraintsDefaultsUsecase {
  FutureOr<ConstraintsModel> execute();
}

@Injectable(as: GetConstraintsDefaultsUsecase)
class GetConstraintsDefaultsUsecaseImpl extends GetConstraintsDefaultsUsecase {
  GetConstraintsDefaultsUsecaseImpl(this._repo);

  final LaunchAssetsRepository _repo;

  @override
  Future<ConstraintsModel> execute() {
    return _repo.getConstraintsDefaults();
  }
}
