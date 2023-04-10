import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/share/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'application_collection_state.dart';

part 'application_collection_cubit.freezed.dart';

class VendorCollectionCubit extends Cubit<ApplicationCollectionState> {
  VendorCollectionCubit({
    required this.vendorCollectionUsecase,
    required this.vendorDeleteUsecase,
  }) : super(ApplicationCollectionState.progress()) {
    tryGetApplications();
  }

  final UsecaseApplicationGetAll vendorCollectionUsecase;
  final UsecaseApplicationDeleteTemplate vendorDeleteUsecase;

  void tryGetApplications() async {
    try {
      await _getApplications();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  void deleteApplication(ApplicationModel applicationModel) async {
    await vendorDeleteUsecase.execute(model: applicationModel);
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
