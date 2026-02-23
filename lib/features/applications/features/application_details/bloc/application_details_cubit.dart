import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'application_details_state.dart';

part 'application_details_cubit.freezed.dart';

class ApplicationDetailsCubit extends Cubit<ApplicationDetailsState> {
  ApplicationDetailsCubit({
    required this.getThemesUseCase,
    required this.getApplicationGet,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.applicationDeleteUsecase,
    required this.applicationId,
    required this.updateBuildNameUseCase,
    required this.updateBuildNumberUseCase,
    required this.updateApplicationUsecase,
    required this.copyThemeUsecase,
    ApplicationModel? applicationModel,
  }) : super(
         ApplicationDetailsState(
           status: ApplicationDetailsStateStatus.progress,
           application: applicationModel,
         ),
       ) {
    _init();
  }

  final String applicationId;

  final UsecaseApplicationGet getApplicationGet;

  final UsecaseThemeGetAll getThemesUseCase;
  final UseCaseSetThemeDefault makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;
  final UpdateBuildNameUseCase updateBuildNameUseCase;
  final UpdateBuildNumberUseCase updateBuildNumberUseCase;
  final UpdateApplicationUsecase updateApplicationUsecase;
  final CopyThemeUsecase copyThemeUsecase;

  Future<void> _init() async {
    await _getThemes();
    await _getApplication();
  }

  Future<void> tryDeleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(deleteTheme: themeModel));
  }

  Future<void> confirmDeleteTheme() async {
    final deleteTheme = state.deleteTheme;
    if (deleteTheme != null) {
      emit(
        state.copyWith(
          deleteTheme: null,
          status: ApplicationDetailsStateStatus.progress,
        ),
      );
      await _deleteTheme(deleteTheme);
    }
  }

  Future<void> declineDeleteTheme() async {
    emit(state.copyWith(deleteTheme: null));
  }

  Future<void> tryDeleteApplication() async {
    emit(state.copyWith(deleteApplication: state.application));
  }

  Future<void> confirmDeleteApplication() async {
    if (state.deleteApplication != null)
      await _tryDeleteApplication(state.deleteApplication!);
    emit(state.copyWith(deleteApplication: null));
  }

  Future<void> declineDeleteApplication() async {
    emit(state.copyWith(deleteApplication: null));
  }

  Future<void> _tryDeleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
      await applicationDeleteUsecase.execute(
        applicationId: applicationModel.id!,
      );
      emit(state.copyWith(status: ApplicationDetailsStateStatus.deleted));
    } on BaseException catch (e) {
      emit(
        state.copyWith(error: e, status: ApplicationDetailsStateStatus.error),
      );
    }
  }

  Future<void> tryMakeThemeAsDefault(ThemeModel themeModel) async {
    try {
      await makeThemeAsDefaultUseCase.execute(
        applicationId: applicationId,
        themeId: themeModel.id!,
      );
    } on BaseException catch (e) {
      emit(
        state.copyWith(error: e, status: ApplicationDetailsStateStatus.error),
      );
    }
  }

  Future<void> _getThemes({bool force = false}) async {
    if (state.themes.isEmpty || force) {
      try {
        emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
        final themes = await getThemesUseCase.execute(
          applicationId: applicationId,
        );
        emit(
          state.copyWith(
            themes: themes,
            status: ApplicationDetailsStateStatus.success,
          ),
        );
      } on BaseException catch (e) {
        emit(
          state.copyWith(error: e, status: ApplicationDetailsStateStatus.error),
        );
      }
    }
  }

  // TODO(Serdun): Clean up code
  Future<void> _getApplication({bool force = false}) async {
    if (state.application == null || force) {
      try {
        emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);

        emit(
          state.copyWith(
            application: application,
            status: ApplicationDetailsStateStatus.success,
          ),
        );
      } on BaseException catch (e) {
        emit(
          state.copyWith(error: e, status: ApplicationDetailsStateStatus.error),
        );
      }
    } else {
      emit(
        state.copyWith(
          application: state.application,
          status: ApplicationDetailsStateStatus.success,
        ),
      );
    }
  }

  Future<void> _deleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
    await deleteThemeUseCase.execute(
      themeId: themeModel.id!,
      applicationId: applicationId,
    );
    await _getThemes();
  }

  Future<void> copyTheme(ThemeModel themeModel) async {
    emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
    await copyThemeUsecase.execute(
      applicationId: applicationId,
      themeId: themeModel.id!,
    );
    await _getThemes();
  }
}
