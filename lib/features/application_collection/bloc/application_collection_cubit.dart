import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/share/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'application_collection_state.dart';

part 'application_collection_cubit.freezed.dart';

class ApplicationCollectionCubit extends Cubit<ApplicationCollectionState> {
  ApplicationCollectionCubit({
    required this.vendorCollectionUsecase,
    required this.vendorDeleteUsecase,
    required this.applicationIncVersion,
  }) : super(ApplicationCollectionState.progress()) {
    tryGetApplications();
  }

  final UsecaseApplicationGetAll vendorCollectionUsecase;
  final UsecaseApplicationDeleteTemplate vendorDeleteUsecase;
  final UsecaseApplicationIncVersion applicationIncVersion;

  void tryGetApplications() async {
    try {
      emit(state.copyWithProgress());
      await _getApplications();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  void deleteApplication(ApplicationModel applicationModel) async {
    try {
      emit(state.copyWithProgress());
      await vendorDeleteUsecase.execute(applicationId: applicationModel.id!);
      tryGetApplications();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  void incrementApplicationVersion(ApplicationModel applicationModel) async {
    await applicationIncVersion.execute(applicationId: applicationModel.id!);
    tryGetApplications();
  }

  void _showNotCaughtFailure(String message) {
    emit(state.copyWithSuccess());
  }

  Future _getApplications() async {
    final result = await vendorCollectionUsecase.execute();
    emit(state.copyWithSuccess(applications: result));
  }
}
