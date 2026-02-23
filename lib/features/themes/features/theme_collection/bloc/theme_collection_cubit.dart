import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'theme_collection_state.dart';

part 'theme_collection_cubit.freezed.dart';

class ThemeCollectionCubit extends Cubit<ThemeCollectionState> {
  ThemeCollectionCubit({
    required this.getAllThemesUseCase,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.applicationDeleteUsecase,
    ApplicationModel? applicationModel,
  }) : super(
         ThemeCollectionState(
           status: ThemeCollectionStateStatus.progress,
           application: applicationModel,
         ),
       ) {
    _init();
  }

  final GetAllThemesUsecase getAllThemesUseCase;
  final UseCaseSetThemeDefault makeThemeAsDefaultUseCase;

  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;

  Future<void> _init() async {
    await _getThemes();
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
          status: ThemeCollectionStateStatus.progress,
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
      emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
      await applicationDeleteUsecase.execute(
        applicationId: applicationModel.id!,
      );
      emit(state.copyWith(status: ThemeCollectionStateStatus.deleted));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
    }
  }

  Future<void> _getThemes({bool force = false}) async {
    if (state.themes.isEmpty || force) {
      try {
        emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
        final themes = await getAllThemesUseCase.execute();
        emit(
          state.copyWith(
            themes: themes,
            status: ThemeCollectionStateStatus.success,
          ),
        );
      } on BaseException catch (e) {
        emit(
          state.copyWith(error: e, status: ThemeCollectionStateStatus.error),
        );
      }
    }
  }

  // Future<void> _executeWithErrorHandling(Future<void> Function() operation) async {
  //   try {
  //     emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
  //     await operation();
  //     emit(state.copyWith(status: ThemeCollectionStateStatus.success));
  //   } on BaseException catch (e) {
  //     emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
  //   }
  // }
  Future<void> _deleteTheme(ThemeModel themeModel) async {
    // emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
    // await deleteThemeUseCase.execute(themeId: themeModel.id!, applicationId: applicationId);
    // await _getThemes();
  }
}
