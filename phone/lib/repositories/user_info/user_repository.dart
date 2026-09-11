import 'dart:async';

import 'package:webtrit_phone/models/models.dart';

import 'user_local_datasource.dart';
import 'user_remote_datasource.dart';

export 'package:webtrit_phone/models/user_info.dart';

export 'user_local_datasource.dart';
export 'user_remote_datasource.dart';

class UserRepository {
  UserRepository({required this.remoteDatasource, required this.localDatasource});

  final UserRemoteDatasource remoteDatasource;
  final UserLocalDatasource localDatasource;
  final _updatesController = StreamController<UserInfo>.broadcast();

  /// Emits cached user information, then successfully persisted updates.
  ///
  /// Never emits an error: a failed fetch is the concern of whoever ran it -
  /// `UserInfoSyncWorker` owns the refresh cycle and propagates its failures.
  /// With no cached value, subscribers wait for the first successful store.
  Stream<UserInfo> getAndListen() async* {
    final info = getLocalInfo();
    if (info != null) yield info;
    yield* _updatesController.stream;
  }

  /// Deletes the user information from the remote source and clears the local cache.
  Future<void> deleteRemote() async {
    await remoteDatasource.delete();
  }

  /// Fetches the latest user information directly from the remote source.
  Future<UserInfo> getRemoteInfo() async => remoteDatasource.getInfo();

  /// Retrieves the locally cached user information, if available.
  UserInfo? getLocalInfo() {
    return localDatasource.getInfo();
  }

  /// Persists [info] and only then publishes it to [getAndListen] subscribers,
  /// so a listener never observes a snapshot the cache does not hold yet.
  Future<void> storeInfo(UserInfo info) async {
    await localDatasource.setInfo(info);
    _updatesController.add(info);
  }
}
