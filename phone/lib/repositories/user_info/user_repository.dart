import 'dart:async';

import 'package:logging/logging.dart';

import 'package:webtrit_phone/common/common.dart';
import 'package:webtrit_phone/models/models.dart';

import 'user_local_datasource.dart';
import 'user_remote_datasource.dart';

export 'package:webtrit_phone/models/user_info.dart';

export 'user_local_datasource.dart';
export 'user_remote_datasource.dart';

final _logger = Logger('UserRepository');

class UserRepository implements Refreshable {
  UserRepository({required this.remoteDatasource, required this.localDatasource});

  final UserRemoteDatasource remoteDatasource;
  final UserLocalDatasource localDatasource;
  final _updatesController = StreamController<UserInfo>.broadcast();

  /// Emits cached user information, then successfully persisted updates.
  ///
  /// Refresh failures are returned by [refresh], not emitted on this stream.
  /// With no cached value, subscribers wait for a successful refresh.
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

  @override
  bool get isActive => true;

  /// Fetches one snapshot and awaits persistence before publishing changes.
  ///
  /// No longer registered with polling: `UserInfoSyncWorker` owns the cycle and
  /// runs it through [storeInfo]. Kept temporarily as a compatibility path until
  /// the follow-up change removes it together with [isActive].
  ///
  /// Unchanged data needs no write. Failures retain their original error and
  /// stack trace so the caller can observe the failed attempt and apply backoff.
  @override
  Future<void> refresh() async {
    try {
      final oldInfo = localDatasource.getInfo();
      final newInfo = await remoteDatasource.getInfo();
      if (newInfo != oldInfo) {
        await storeInfo(newInfo);
      }
    } catch (e, stackTrace) {
      _logger.warning('refresh', e, stackTrace);
      rethrow;
    }
  }
}
