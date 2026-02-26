import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class CreateShareTokenUsecase {
  Future<String> execute({
    required String applicationId,
    required String themeId,
    String? tag,
  });
}

@Injectable(as: CreateShareTokenUsecase)
class CreateShareTokenUsecaseImpl extends CreateShareTokenUsecase {
  CreateShareTokenUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<String> execute({
    required String applicationId,
    required String themeId,
    String? tag,
  }) {
    return _repo.createShareToken(applicationId, themeId, tag: tag);
  }
}
