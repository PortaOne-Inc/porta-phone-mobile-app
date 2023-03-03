part of 'vendor_collection_cubit.dart';

@immutable
abstract class VendorCollectionState {
  const VendorCollectionState(this.apps);

  final List<ApplicationModel> apps;
}

class AppsInitial extends VendorCollectionState {
  const AppsInitial(super.apps);
}

class AppsInitialized extends VendorCollectionState {
  const AppsInitialized(super.apps);
}

class AppsNotCaughtFailure extends VendorCollectionState {
  const AppsNotCaughtFailure(super.apps, this.message);

  final String message;
}
