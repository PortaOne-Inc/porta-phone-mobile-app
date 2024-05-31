import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';

part 'application_details_state.dart';

part 'application_details_cubit_utility.dart';

part 'application_details_cubit.freezed.dart';

class ApplicationDetailsCubit extends Cubit<ApplicationDetailsState> {
  ApplicationDetailsCubit({
    required this.getThemesUseCase,
    required this.getApplicationGet,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.applicationEditUsecase,
    required this.applicationDeleteUsecase,
    required this.applicationId,
    required this.usecaseDeployBuilds,
    required this.updateBuildNameUseCase,
    required this.updateBuildNumberUseCase,
    ApplicationModel? applicationModel,
  }) : super(ApplicationDetailsState(
          status: ApplicationDetailsStateStatus.progress,
          application: applicationModel,
          applicationDeploy: ApplicationDeploy.init(),
        )) {
    _init();
  }

  final String applicationId;

  final UsecaseApplicationGet getApplicationGet;

  final UsecaseThemeGetAll getThemesUseCase;
  final UseCaseSetThemeDefault makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;
  final UsecaseApplicationEdit applicationEditUsecase;
  final UsecaseDeployBuilds usecaseDeployBuilds;
  final UpdateBuildNameUseCase updateBuildNameUseCase;
  final UpdateBuildNumberUseCase updateBuildNumberUseCase;

  Future<void> _init() async {
    await _getThemes();
    await _getApplication();

    _checkValidationOfApplication();
  }

  Future<void> tryDeleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(deleteTheme: themeModel));
  }

  Future<void> confirmDeleteTheme() async {
    if (state.deleteTheme != null) await _deleteTheme(state.deleteTheme!);

    emit(state.copyWith(deleteTheme: null));
  }

  Future<void> declineDeleteTheme() async {
    emit(state.copyWith(deleteTheme: null));
  }

  Future<void> tryDeleteApplication() async {
    emit(state.copyWith(deleteApplication: state.application));
  }

  Future<void> confirmDeleteApplication() async {
    if (state.deleteApplication != null) await _tryDeleteApplication(state.deleteApplication!);
    emit(state.copyWith(deleteApplication: null));
  }

  Future<void> declineDeleteApplication() async {
    emit(state.copyWith(deleteApplication: null));
  }

  Future<void> _tryDeleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
      await applicationDeleteUsecase.execute(applicationId: applicationModel.id!);
      emit(state.copyWith(status: ApplicationDetailsStateStatus.deleted));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future<void> tryMakeThemeAsDefault(ThemeModel themeModel) async {
    try {
      await makeThemeAsDefaultUseCase.execute(applicationId: applicationId, themeId: themeModel.id!);
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future<void> _getThemes() async {
    try {
      emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
      final themes = await getThemesUseCase.execute(applicationId: applicationId);
      emit(state.copyWith(themes: themes, status: ApplicationDetailsStateStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future<void> _getApplication() async {
    if (state.application == null) {
      try {
        emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);

        emit(state.copyWith(
          application: application,
          status: ApplicationDetailsStateStatus.success,
        ));
      } on BaseException catch (e) {
        emit(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
      }
    }
  }

  void _checkValidationOfApplication() {
    if (state.application != null) {
      final applicationValidation = _validateApplication(state.application!);
      emit(state.copyWith(applicationValidateErrors: applicationValidation));
    }
  }

  Future<void> _deleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(status: ApplicationDetailsStateStatus.progress));
    await deleteThemeUseCase.execute(themeId: themeModel.id!, applicationId: applicationId);
    await _getThemes();
  }

  Future<void> updateApplicationDeploy(ApplicationDeploy model) async {
    emit(state.copyWith(applicationDeploy: model));
  }

  Future<void> deployBuilds() async {
    emitRollback(state.copyWith(status: ApplicationDetailsStateStatus.deployConfirm));
  }

  Future<void> confirmDeployBuilds() async {
    try {
      await usecaseDeployBuilds.execute(
        applicationId: state.application!.id!,
        applicationDeploy: state.applicationDeploy,
      );
      emitRollback(state.copyWith(status: ApplicationDetailsStateStatus.deploySuccess));
    } catch (e) {
      emitRollback(state.copyWith(error: e, status: ApplicationDetailsStateStatus.error));
    }
  }

  Future<void> updateBuildName(BuildPlatform platform, VersionPart part) async {
    try {
      emit(state.copyWithAddingProgressName(platform));

      final version = await updateBuildNameUseCase.execute(
        application: state.application!,
        platform: platform,
        part: part,
      );

      final versionState = state.copyWithVersions(
        android: platform == BuildPlatform.android ? version : null,
        ios: platform == BuildPlatform.ios ? version : null,
      );

      emit(versionState.copyWithRemovingProgressName(platform));
    } catch (e) {
      final errorState = state.copyWith(
        error: e,
        status: ApplicationDetailsStateStatus.error,
      );

      emit(errorState.copyWithRemovingProgressName(platform));
    }
  }

  Future<void> updateBuildNumber(BuildPlatform platform) async {
    try {
      emit(state.copyWithAddingProgressNumber(platform));

      final version = await updateBuildNumberUseCase.execute(
        application: state.application!,
        platform: platform,
      );

      final versionState = state.copyWithVersions(
        android: platform == BuildPlatform.android ? version : null,
        ios: platform == BuildPlatform.ios ? version : null,
      );

      emit(versionState.copyWithRemovingProgressNumber(platform));
    } catch (e) {
      final errorState = state.copyWith(
        error: e,
        status: ApplicationDetailsStateStatus.error,
      );

      emit(errorState.copyWithRemovingProgressNumber(platform));
    }
  }
}
