import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/features/theme_collection/theme_collection.dart';
import 'package:webtrit_configurator/share/share.dart';

part 'synchronize_state.dart';

class SynchronizeCubit extends Cubit<SynchronizeState> {
  SynchronizeCubit({
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    required this.getUserUsecase,
    required this.applicationId,
    required this.themeId,
  }) : super(const SyncInitial()) {
    _tryGetTheme();
  }

  final String applicationId;
  final String themeId;
  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGetById getThemeUseCase;
  final UsecaseUserGet getUserUsecase;

  void showThemeCredential() async {
    final userModel = await getUserUsecase.execute();
    emit(ShowThemeCredentials(
      themeId: themeId,
      vendorId: applicationId,
      userId: userModel.id,
    ));
  }

  void validateAndTryUpdateTheme(ThemeModel? themeModel) async {
    if (themeModel != null) {
      if (themeModel.commonConfig.appName.isNotEmpty) {
        _tryUpdateTheme(themeModel);
      } else {
        emit(const ThemeIsNotValidState());
      }
    }
  }

  Future<void> _tryGetTheme() async {
    try {
      await _getTheme();
    } on NoContentException catch (e) {
      _showNotCaughtFailure(e.message);
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  Future<void> _tryUpdateTheme(ThemeModel themeModel) async {
    try {
      await _updateTheme(themeModel);
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  Future _getTheme() async {
    final model = await getThemeUseCase.execute(
      themeId: themeId,
      applicationId: applicationId,
    );
    emit(ThemeReadyState(model));
  }

  Future _updateTheme(ThemeModel themeModel) async {
    emit(const SyncStateProgress());
    await updateThemeUseCase.execute(applicationId: applicationId, themeModel: themeModel);
    emit(const SyncInitial());
  }

  void _showNotCaughtFailure(String message) {
    emit(ThemeEditSyncFailure(message));
  }
}
