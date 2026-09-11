import 'package:webtrit_phone/repositories/repositories.dart';
import 'package:webtrit_phone/services/services.dart';

/// The charge for a finished call lands after the hangup, like its CDR does.
const _postCallRefreshDelay = Duration(seconds: 1);

/// Owns the user-info worker and its polling registration.
///
/// Scheduled refreshes, the Settings pull gesture, and call-ended invalidations
/// use the same polling task, so they share one lifecycle, single-flight
/// boundary, and backoff policy.
final class UserInfoSync extends PollingWorkerOwner<UserInfoSyncWorker> {
  UserInfoSync({
    required super.worker,
    required super.pollingService,
    required super.interval,
    this.postCallRefreshDelay = _postCallRefreshDelay,
  });

  /// How long after a call ends the refresh is requested; the shell supplies
  /// the configured value, tests and direct construction keep the default.
  final Duration postCallRefreshDelay;

  /// Requests one refresh once the backend has had time to charge the call, so
  /// the balance on screen reflects it without waiting for the next tick.
  ///
  /// Repeated call-ended events use the task's trailing-edge debounce instead
  /// of cancelling and recreating the polling schedule.
  void requestPostCallRefresh() {
    invalidatePollingTask(after: postCallRefreshDelay);
  }
}

/// Synchronizes the user record (balance, numbers, credentials) into the
/// local cache.
///
/// One [refresh] is the complete cycle: fetch the remote snapshot, compare it
/// with the cached one, and store it through [UserRepository.storeInfo], which
/// persists before publishing. An unchanged snapshot needs no write. Failures
/// propagate with their original error and stack trace; the API client and
/// [PollingService] already log them, so the worker adds no log of its own.
/// [PollingService] owns scheduling, connectivity, lifecycle, single-flight,
/// and backoff.
class UserInfoSyncWorker implements PollingWorker {
  UserInfoSyncWorker({required UserRepository userRepository}) : _userRepository = userRepository;

  final UserRepository _userRepository;

  bool _disposed = false;

  @override
  bool get isActive => !_disposed;

  @override
  Future<void> refresh() async {
    if (_disposed) {
      throw StateError('Cannot refresh a disposed user info sync worker.');
    }
    final cached = _userRepository.getLocalInfo();
    final fresh = await _userRepository.getRemoteInfo();
    if (_disposed) {
      throw StateError('Cannot persist user info after worker disposal.');
    }
    if (fresh != cached) {
      await _userRepository.storeInfo(fresh);
    }
  }

  @override
  Future<void> dispose() {
    _disposed = true;
    return Future<void>.value();
  }
}
