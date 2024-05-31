import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../../../model/models.dart';

part 'application_collection_state.dart';

part 'application_collection_cubit_utility.dart';

part 'application_collection_cubit.freezed.dart';

class ApplicationCollectionCubit extends Cubit<ApplicationCollectionState> {
  ApplicationCollectionCubit({
    required this.applicationCollectionUsecase,
    required this.applicationDeleteUsecase,
    required this.applicationIncVersion,
  }) : super(const ApplicationCollectionState(status: ApplicationsStateStatus.initial)) {
    tryGetApplications();
  }

  final UsecaseApplicationGetAll applicationCollectionUsecase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;
  final UsecaseApplicationIncVersion applicationIncVersion;

  Future<void> tryGetApplications() async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await _getApplications();
    } on Exception catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> incrementApplicationVersion(ApplicationModel applicationModel) async {
    await applicationIncVersion.execute(applicationId: applicationModel.id!);
    await tryGetApplications();
  }

  Future<void> _getApplications() async {
    final result = await applicationCollectionUsecase.execute();
    final applications = result.map((it) => (it, _validateApplication(it)));

    emit(state.copyWith(
      status: ApplicationsStateStatus.success,
      applications: applications.toList(),
    ));
  }

  Future<void> tryDeleteApplication(ApplicationModel application) async {
    emit(state.copyWith(deleteApplication: application));
  }

  Future<void> confirmDeleteApplication() async {
    if (state.deleteApplication != null) await _tryDeleteApplication(state.deleteApplication!);
    emit(state.copyWith(deleteApplication: null));
  }

  Future<void> _tryDeleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await applicationDeleteUsecase.execute(applicationId: applicationModel.id!);
      await _getApplications();
    } on BaseException catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> declineDeleteApplication() async {
    emit(state.copyWith(deleteApplication: null));
  }
}
