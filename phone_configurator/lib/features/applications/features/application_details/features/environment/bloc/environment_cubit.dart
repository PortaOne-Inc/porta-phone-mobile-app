import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_state.dart';

part 'environment_cubit.freezed.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit({
    required String applicationId,
    required this.updateApplicationEnvironmentUsecase,
    required this.getApplicationEnvironmentUsecase,
  }) : super(EnvironmentState(applicationId: applicationId)) {
    getEnvironment();
  }

  final UpdateApplicationEnvironmentUsecase updateApplicationEnvironmentUsecase;
  final GetApplicationEnvironmentUsecase getApplicationEnvironmentUsecase;

  Future<void> getEnvironment() async {
    emit(state.copyWith(status: EnvironmentStatus.loading));
    try {
      final environment = await getApplicationEnvironmentUsecase.execute(
        applicationId: state.applicationId,
      );
      emit(
        state.copyWith(
          status: EnvironmentStatus.loaded,
          environment: environment,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: EnvironmentStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> updateEnvironment() async {
    emit(state.copyWith(status: EnvironmentStatus.loading));
    try {
      await updateApplicationEnvironmentUsecase.execute(
        applicationId: state.applicationId,
        environment: state.environment,
      );
      emit(state.copyWith(status: EnvironmentStatus.initial));
    } catch (error) {
      emit(
        state.copyWith(
          status: EnvironmentStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void updateKeyValue<T>(String key, T value) {
    emit(state.copyWith(environment: Map.of(state.environment)..[key] = value));
  }

  void removeAttribute(String key) {
    if (!state.environment.containsKey(key)) return;
    final updatedEnvironment = Map<String, dynamic>.from(state.environment)
      ..remove(key);
    emit(state.copyWith(environment: updatedEnvironment));
  }
}
