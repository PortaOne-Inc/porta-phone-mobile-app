import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/applications/model/models.dart';

import '../../../models/models.dart';

part 'deployment_state.dart';

part 'deployment_cubit.freezed.dart';

class DeploymentCubit extends Cubit<DeploymentState> {
  DeploymentCubit({
    required this.applicationId,
    required this.getApplicationGet,
    required this.updateBuildNameUseCase,
    required this.updateBuildNumberUseCase,
    required this.updateApplicationUsecase,
    required this.getPhoneBranchesUsecase,
    required this.usecaseDeployBuilds,
  }) : super(const DeploymentState()) {
    _getApplication();
    _getPhoneBranches();
  }

  final String applicationId;
  final UsecaseApplicationGet getApplicationGet;
  final UpdateBuildNameUseCase updateBuildNameUseCase;
  final UpdateBuildNumberUseCase updateBuildNumberUseCase;
  final UpdateApplicationUsecase updateApplicationUsecase;
  final GetPhoneBranchesUsecase getPhoneBranchesUsecase;
  final UsecaseDeployBuilds usecaseDeployBuilds;

  // TODO(Serdun): Clean up code
  Future<void> _getApplication({bool force = false}) async {
    if (state.application == null || force) {
      try {
        emit(state.copyWith(status: DeploymentDetailsStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);

        emit(state.copyWith(
          application: application,
          applicationDeploy: state.applicationDeploy,
          status: DeploymentDetailsStatus.success,
        ));
      } on BaseException catch (e) {
        emit(state.copyWith(error: e, status: DeploymentDetailsStatus.error));
      }
    } else {
      emit(state.copyWith(
        application: state.application,
        applicationDeploy: state.applicationDeploy,
        status: DeploymentDetailsStatus.success,
      ));
    }
  }

  Future<void> _getPhoneBranches() async {
    await _executeWithErrorHandling(() async {
      final branches = await getPhoneBranchesUsecase.execute();

      final updatedDependencyBranches = state.applicationDeploy.applicationDependencyBranches.copyWith(
        phoneBranches: branches,
      );
      final updatedApplicationDeploy = state.applicationDeploy.copyWith(
        applicationDependencyBranches: updatedDependencyBranches,
      );

      emit(state.copyWith(
        applicationDeploy: updatedApplicationDeploy,
        status: DeploymentDetailsStatus.success,
      ));
    });
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
        status: DeploymentDetailsStatus.error,
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
        status: DeploymentDetailsStatus.error,
      );

      emit(errorState.copyWithRemovingProgressNumber(platform));
    }
  }

  Future<void> updateApplicationDeploy(ApplicationDeploy model) async {
    updateApplicationUsecase.execute(state.application!);
    emit(state.copyWith(applicationDeploy: model));
  }

  Future<void> deployBuilds() async {
    emitRollback(state.copyWith(status: DeploymentDetailsStatus.deployConfirm));
  }

  Future<void> _executeWithErrorHandling(Future<void> Function() operation) async {
    try {
      emit(state.copyWith(status: DeploymentDetailsStatus.progress));
      await operation();
      emit(state.copyWith(status: DeploymentDetailsStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: DeploymentDetailsStatus.error));
    }
  }

  Future<void> confirmDeployBuilds() async {
    try {
      await usecaseDeployBuilds.execute(
        applicationId: state.application!.id!,
        applicationDeploy: state.applicationDeploy,
      );

      await _getApplication(force: true);

      emitRollback(state.copyWith(status: DeploymentDetailsStatus.deploySuccess));
    } catch (e) {
      emitRollback(state.copyWith(error: e, status: DeploymentDetailsStatus.error));
    }
  }
}
