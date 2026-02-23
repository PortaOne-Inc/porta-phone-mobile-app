import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'application_collection_state.dart';

part 'application_collection_cubit.freezed.dart';

class ApplicationCollectionCubit extends Cubit<ApplicationCollectionState> {
  ApplicationCollectionCubit({
    required this.applicationCollectionUsecase,
    required this.applicationDeleteUsecase,
    required this.applicationIncVersion,
    required this.getUserUsecase,
  }) : super(
         const ApplicationCollectionState(
           status: ApplicationsStateStatus.initial,
         ),
       ) {
    load();
  }

  final UsecaseApplicationGetAll applicationCollectionUsecase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;
  final UsecaseApplicationIncVersion applicationIncVersion;
  final GetUserUsecase getUserUsecase;

  Future<void> load() async {
    emit(state.copyWith(status: ApplicationsStateStatus.progress, error: null));

    unawaited(tryGetApplications());
    unawaited(tryGetUser());
  }

  Future<void> tryGetUser() async {
    final user = await getUserUsecase.execute();
    emit(state.copyWith(user: user));
  }

  Future<void> tryGetApplications() async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await _getApplications();
    } on Exception catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> incrementApplicationVersion(
    ApplicationModel applicationModel,
  ) async {
    await applicationIncVersion.execute(applicationId: applicationModel.id!);
    await tryGetApplications();
  }

  Future<void> _getApplications() async {
    final applications = await applicationCollectionUsecase.execute();

    emit(
      state.copyWith(
        status: ApplicationsStateStatus.success,
        applications: applications,
      ),
    );
  }

  Future<void> tryDeleteApplication(ApplicationModel application) async {
    emit(state.copyWith(deleteApplication: application));
  }

  Future<void> confirmDeleteApplication() async {
    final deleteApplication = state.deleteApplication;
    if (deleteApplication != null) {
      emit(
        state.copyWith(
          deleteApplication: null,
          status: ApplicationsStateStatus.progress,
        ),
      );
      await _tryDeleteApplication(deleteApplication);
    }
  }

  Future<void> _tryDeleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await applicationDeleteUsecase.execute(
        applicationId: applicationModel.id!,
      );
      await _getApplications();
    } on BaseException catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> declineDeleteApplication() async {
    emit(state.copyWith(deleteApplication: null));
  }
}
