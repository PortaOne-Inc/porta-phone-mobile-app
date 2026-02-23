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
    required this.getCallkeepBranchesUsecase,
    required this.usecaseDeployBuilds,
  }) : super(const DeploymentState()) {
    _getApplication();
    _getPhoneBranches();
    _getCallkeepBranches();
  }

  final String applicationId;
  final UsecaseApplicationGet getApplicationGet;
  final UpdateBuildNameUseCase updateBuildNameUseCase;
  final UpdateBuildNumberUseCase updateBuildNumberUseCase;
  final UpdateApplicationUsecase updateApplicationUsecase;
  final GetPhoneBranchesUsecase getPhoneBranchesUsecase;
  final GetCallkeepBranchesUsecase getCallkeepBranchesUsecase;
  final UsecaseDeployBuilds usecaseDeployBuilds;

  // TODO(Serdun): Clean up code
  Future<void> _getApplication({bool force = false}) async {
    if (state.application == null || force) {
      try {
        emit(state.copyWith(status: DeploymentDetailsStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);

        emit(
          state.copyWith(
            application: application,
            applicationDeploy: state.applicationDeploy,
            status: DeploymentDetailsStatus.success,
          ),
        );
      } on BaseException catch (e) {
        emit(state.copyWith(error: e, status: DeploymentDetailsStatus.error));
      }
    } else {
      emit(
        state.copyWith(
          application: state.application,
          applicationDeploy: state.applicationDeploy,
          status: DeploymentDetailsStatus.success,
        ),
      );
    }
  }

  Future<void> _getPhoneBranches() async {
    await _executeWithErrorHandling(() async {
      final branches = await getPhoneBranchesUsecase.execute();

      final updatedDependencyBranches = state
          .applicationDeploy
          .applicationDependencyBranches
          .copyWith(phoneBranches: branches);
      final updatedApplicationDeploy = state.applicationDeploy.copyWith(
        applicationDependencyBranches: updatedDependencyBranches,
      );

      emit(
        state.copyWith(
          applicationDeploy: updatedApplicationDeploy,
          status: DeploymentDetailsStatus.success,
        ),
      );
    });
  }

  Future<void> _getCallkeepBranches() async {
    await _executeWithErrorHandling(() async {
      final branches = await getCallkeepBranchesUsecase.execute();

      final updatedDependencyBranches = state
          .applicationDeploy
          .applicationDependencyBranches
          .copyWith(callkeepBranches: branches);
      final updatedApplicationDeploy = state.applicationDeploy.copyWith(
        applicationDependencyBranches: updatedDependencyBranches,
      );

      emit(
        state.copyWith(
          applicationDeploy: updatedApplicationDeploy,
          status: DeploymentDetailsStatus.success,
        ),
      );
    });
  }

  Future<void> updateBuildName(BuildPlatform platform, VersionPart part) async {
    try {
      emit(
        state.copyWith.buildVersionProgress(
          progressNameUpdating: [
            ...state.buildVersionProgress.progressNameUpdating,
            platform,
          ],
        ),
      );

      final version = await updateBuildNameUseCase.execute(
        application: state.application!,
        platform: platform,
        part: part,
      );

      emit(
        state.copyWith(
          application: state.application?.copyWith(
            androidVersion: platform == BuildPlatform.android
                ? version
                : state.application?.androidVersion,
            iosVersion: platform == BuildPlatform.ios
                ? version
                : state.application?.iosVersion,
          ),
          buildVersionProgress: state.buildVersionProgress.copyWith(
            progressNameUpdating: state
                .buildVersionProgress
                .progressNameUpdating
                .where((it) => it != platform)
                .toList(),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e,
          status: DeploymentDetailsStatus.error,
          buildVersionProgress: state.buildVersionProgress.copyWith(
            progressNameUpdating: state
                .buildVersionProgress
                .progressNameUpdating
                .where((it) => it != platform)
                .toList(),
          ),
        ),
      );
    }
  }

  Future<void> updateBuildNumber(BuildPlatform platform) async {
    try {
      emit(
        state.copyWith.buildVersionProgress(
          progressNumberUpdating: [
            ...state.buildVersionProgress.progressNumberUpdating,
            platform,
          ],
        ),
      );

      final version = await updateBuildNumberUseCase.execute(
        application: state.application!,
        platform: platform,
      );

      emit(
        state.copyWith(
          application: state.application?.copyWith(
            androidVersion: platform == BuildPlatform.android
                ? version
                : state.application?.androidVersion,
            iosVersion: platform == BuildPlatform.ios
                ? version
                : state.application?.iosVersion,
          ),
          buildVersionProgress: state.buildVersionProgress.copyWith(
            progressNumberUpdating: state
                .buildVersionProgress
                .progressNumberUpdating
                .where((it) => it != platform)
                .toList(),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e,
          status: DeploymentDetailsStatus.error,
          buildVersionProgress: state.buildVersionProgress.copyWith(
            progressNumberUpdating: state
                .buildVersionProgress
                .progressNumberUpdating
                .where((it) => it != platform)
                .toList(),
          ),
        ),
      );
    }
  }

  Future<void> updateApplicationDeploy(ApplicationDeploy model) async {
    updateApplicationUsecase.execute(state.application!);
    emit(state.copyWith(applicationDeploy: model));
  }

  Future<void> deployBuilds() async {
    emitRollback(state.copyWith(status: DeploymentDetailsStatus.deployConfirm));
  }

  Future<void> _executeWithErrorHandling(
    Future<void> Function() operation,
  ) async {
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

      emitRollback(
        state.copyWith(status: DeploymentDetailsStatus.deploySuccess),
      );
    } catch (e) {
      emitRollback(
        state.copyWith(error: e, status: DeploymentDetailsStatus.error),
      );
    }
  }
}
