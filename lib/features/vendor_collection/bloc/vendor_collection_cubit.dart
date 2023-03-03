import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/implementation/common/base_exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'vendor_collection_state.dart';

class VendorCollectionCubit extends Cubit<VendorCollectionState> {
  VendorCollectionCubit({
    required this.vendorCollectionUsecase,
    required this.vendorDeleteUsecase,
  }) : super(const AppsInitial([])) {
    tryGetApplications();
  }

  final UsecaseVendorGetAll vendorCollectionUsecase;
  final UsecaseVendorDeleteTemplate vendorDeleteUsecase;

  void tryGetApplications() async {
    try {
      await _getApplications();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  void _showNotCaughtFailure(String message) {
    emit(AppsNotCaughtFailure(state.apps, message));
  }

  Future _getApplications() async {
    final result = await vendorCollectionUsecase.execute();
    emit(AppsInitialized(result));
  }

  void deleteApplication(ApplicationModel applicationModel) async {
    await vendorDeleteUsecase.execute(model: applicationModel);
    tryGetApplications();
  }
}
