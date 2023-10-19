import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'application_details_state.dart';

part 'application_details_cubit.freezed.dart';

class ApplicationDetailsCubit extends Cubit<ApplicationDetailsState> {
  ApplicationDetailsCubit({
    ApplicationModel? applicationModel,
    required this.getThemesUseCase,
    required this.getApplicationGet,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.applicationDeleteUsecase,
    required this.applicationId,
  }) : super(ApplicationDetailsState(
          status: ApplicationDetailsStateStatus.progress,
          application: applicationModel,
        )) {
    getThemes();
    _getApplication();
  }

  final String applicationId;

  final UsecaseApplicationGet getApplicationGet;

  final UsecaseThemeGetAll getThemesUseCase;
  final UseCaseSetThemeDefault makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;

  void tryDeleteTheme(ThemeModel themeModel) async {
    try {
      await _deleteTheme(themeModel);
    } on BaseException catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void tryDeleteApplication() async {
    try {
      emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
      await applicationDeleteUsecase.execute(applicationId: applicationId);
      emit(state.copyWith(status: ApplicationDetailsStateStatus.deleted));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  void tryMakeThemeAsDefault(ThemeModel themeModel) async {
    try {
      await makeThemeAsDefaultUseCase.execute(applicationId: applicationId, themeId: themeModel.id!);
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future getThemes() async {
    try {
      emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
      final themes = await getThemesUseCase.execute(applicationId: applicationId);
      emit(state.copyWith(themes: themes, status: ApplicationDetailsStateStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future _getApplication() async {
    if (state.application == null) {
      try {
        emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);
        emit(state.copyWith(application: application, status: ApplicationDetailsStateStatus.success));
      } on BaseException catch (e) {
        emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
      }
    }
  }

  Future _deleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
    await deleteThemeUseCase.execute(themeId: themeModel.id!, applicationId: applicationId);
    getThemes();
  }
}
