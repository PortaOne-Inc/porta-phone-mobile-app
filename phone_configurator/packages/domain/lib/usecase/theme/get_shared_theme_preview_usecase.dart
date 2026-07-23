import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class GetSharedThemePreviewUsecase {
  Future<SharedThemePreviewModel> execute({required String token});
}

@Injectable(as: GetSharedThemePreviewUsecase)
class GetSharedThemePreviewUsecaseImpl extends GetSharedThemePreviewUsecase {
  GetSharedThemePreviewUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<SharedThemePreviewModel> execute({required String token}) {
    return _repo.getSharedThemePreview(token);
  }
}
