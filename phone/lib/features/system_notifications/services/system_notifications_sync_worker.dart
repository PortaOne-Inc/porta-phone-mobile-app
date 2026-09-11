import 'package:logging/logging.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/system_notifications/system_notifications_local_repository.dart';
import 'package:webtrit_phone/repositories/system_notifications/system_notifications_remote_repository.dart';
import 'package:webtrit_phone/services/services.dart';

final _logger = Logger('SystemNotificationsSyncWorker');

/// Owns the system notifications worker and its polling registration.
///
/// The feature has no pull-to-refresh and no domain trigger of its own, so the
/// standard owner is the whole of it: one lifecycle, one single-flight
/// boundary, one backoff policy.
final class SystemNotificationsSync extends PollingWorkerOwner<SystemNotificationsSyncWorker> {
  SystemNotificationsSync({required super.worker, required super.pollingService, required super.interval});
}

/// Synchronizes remote system notifications with the local store.
///
/// One [refresh] is a finite domain sync cycle. [PollingService] owns
/// scheduling, connectivity, lifecycle, single-flight, and backoff.
///
/// A cycle fetches either the initial history or every update since the last
/// locally known one - never both, so the first cycle after a wipe stays one
/// bounded request.
class SystemNotificationsSyncWorker implements PollingWorker {
  SystemNotificationsSyncWorker(this.localRepo, this.remoteRepo, {this.pageSize = 50})
    : assert(pageSize > 0, 'pageSize must be greater than zero');

  final SystemNotificationsLocalRepository localRepo;
  final SystemNotificationsRemoteRepository remoteRepo;

  final int pageSize;

  @override
  bool get isActive => !_disposed;

  /// Runs one complete sync cycle and returns when local persistence has
  /// finished.
  ///
  /// Failures keep their original error and stack trace so the caller can
  /// apply retry or backoff policy.
  @override
  Future<void> refresh() async {
    if (_disposed) {
      throw StateError('Cannot refresh a disposed system notifications sync worker.');
    }

    final lastUpdate = await localRepo.getLastUpdate();

    if (lastUpdate == null) {
      await _refreshInitialHistory();
    } else {
      await _refreshUpdatesSince(lastUpdate);
    }
  }

  Future<void> _refreshInitialHistory() async {
    final notifications = await remoteRepo.getHistory(limit: pageSize);
    _logger.fine('Initial notifications fetched: ${notifications.length}');

    // An absent local anchor is the durable marker of a first load, so the
    // bulk it brings is history rather than news and must not produce a push
    // per record. The store is the source of truth for that, which is why the
    // worker keeps no "have I already synced" flag of its own: one that lives
    // in memory is lost whenever the worker is rebuilt, and then a first load
    // pushes its whole history at the user.
    await localRepo.upsertNotifications(notifications.reversed.toList(), initialData: true);
  }

  Future<void> _refreshUpdatesSince(DateTime lastUpdate) async {
    var since = lastUpdate;

    while (true) {
      final updates = await remoteRepo.getUpdates(since: since, limit: pageSize);
      _logger.fine('Updates fetched since $since: ${updates.length}');
      await localRepo.upsertNotifications(updates);

      if (updates.length < pageSize) break;

      // The endpoint pages by timestamp, not by page number, so the anchor has
      // to move or the same full page is fetched forever. A full page whose
      // records do not move it ends the cycle instead: the store now holds
      // them, so the next cycle resumes from its own advanced anchor.
      final newest = _newestUpdate(updates);
      if (!newest.isAfter(since)) break;
      since = newest;
    }
  }

  DateTime _newestUpdate(List<SystemNotification> notifications) =>
      notifications.map((notification) => notification.updatedAt).reduce((a, b) => a.isAfter(b) ? a : b);

  bool _disposed = false;

  @override
  Future<void> dispose() async {
    if (_disposed) return;

    _logger.info('Disposing');
    _disposed = true;
  }
}
