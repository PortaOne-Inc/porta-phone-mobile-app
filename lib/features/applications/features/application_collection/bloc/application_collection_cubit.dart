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
  }) : super(const ApplicationCollectionState(status: ApplicationsStateStatus.initial)) {
    tryGetApplications();
  }

  final UsecaseApplicationGetAll applicationCollectionUsecase;
  final UsecaseApplicationDeleteTemplate applicationDeleteUsecase;
  final UsecaseApplicationIncVersion applicationIncVersion;

  void tryGetApplications() async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await _getApplications();
    } on Exception catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void incrementApplicationVersion(ApplicationModel applicationModel) async {
    await applicationIncVersion.execute(applicationId: applicationModel.id!);
    tryGetApplications();
  }

  Future _getApplications() async {
    final result = await applicationCollectionUsecase.execute();
    emit(state.copyWith(
      status: ApplicationsStateStatus.success,
      applications: result,
    ));
  }

  void tryDeleteApplication(ApplicationModel application) async {
    emit(state.copyWith(deleteApplication: application));
  }

  void confirmDeleteApplication() async {
    if (state.deleteApplication != null) _tryDeleteApplication(state.deleteApplication!);
    emit(state.copyWith(deleteApplication: null));
  }

  void _tryDeleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWith(status: ApplicationsStateStatus.progress));
      await applicationDeleteUsecase.execute(applicationId: applicationModel.id!);
      _getApplications();
    } on BaseException catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void declineDeleteApplication() async {
    emit(state.copyWith(deleteApplication: null));
  }
}
