import 'dart:async';

import 'package:logging/logging.dart';

import 'package:webtrit_phone/models/system_notification_event.dart';
import 'package:webtrit_phone/models/system_notification_outbox_entry.dart';
import 'package:webtrit_phone/repositories/system_notifications/system_notifications_local_repository.dart';
import 'package:webtrit_phone/repositories/system_notifications/system_notifications_remote_repository.dart';
import 'package:webtrit_phone/services/services.dart';

final _logger = Logger('SystemNotificationsOutboxWorker');

/// How long a requested flush waits for the taps that may follow it.
const _flushDebounce = Duration(seconds: 1);

/// Owns the outbox worker and its polling registration.
///
/// The queue is filled by a tap, so the interval is only a safety net for what
/// a previous session left behind; [requestFlush] carries the ordinary case.
final class SystemNotificationsOutbox extends PollingWorkerOwner<SystemNotificationsOutboxWorker> {
  SystemNotificationsOutbox({
    required super.worker,
    required super.pollingService,
    required super.interval,
    this.flushDebounce = _flushDebounce,
  });

  /// How long a flush waits before running, so that reading a list of
  /// notifications is one send rather than one per tap.
  final Duration flushDebounce;

  /// Sends what the queue holds soon, instead of waiting for the next tick.
  ///
  /// The wait is the task's trailing-edge debounce, so reading through a
  /// screenful of notifications collapses into a single cycle. That matters
  /// most when the backend is failing: a flush runs the cycle whether or not
  /// the task is backing off, and without the debounce a scrolled list would
  /// be one request per tap at a backend that is already refusing them.
  void requestFlush() {
    invalidatePollingTask(after: flushDebounce);
  }
}

/// Sends the locally queued system notification actions to the backend.
///
/// Marking a notification as seen is written to the outbox rather than sent
/// from the screen, so the tap survives being offline and being killed. One
/// [refresh] is one attempt at every pending entry; [PollingService] owns
/// scheduling, connectivity, single-flight, and the delay between attempts.
class SystemNotificationsOutboxWorker implements PollingWorker {
  SystemNotificationsOutboxWorker(this.localRepo, this.remoteRepo) {
    // The queue is reconciled against what the backend confirms, so the
    // subscription belongs to the worker's own lifetime rather than to a
    // separate init() a caller has to remember.
    _confirmationsSub = localRepo.eventBus.listen(_onLocalEvent);
  }

  final SystemNotificationsLocalRepository localRepo;
  final SystemNotificationsRemoteRepository remoteRepo;

  late final StreamSubscription<SystemNotificationEvent> _confirmationsSub;

  @override
  bool get isActive => !_disposed;

  /// Attempts every pending entry once and returns when the queue has been
  /// walked.
  ///
  /// A failing entry does not stop the others: the cycle keeps going and then
  /// rethrows the first failure with its original stack trace, so polling
  /// applies backoff to a real error while the rest of the queue still drains.
  /// A failed entry is left exactly as it was, so the next cycle retries it.
  @override
  Future<void> refresh() async {
    _ensureActive();

    final pending = await localRepo.getOutboxNotifications(
      actionType: SnOutboxActionType.seen,
      states: const [SnOutboxState.pending],
    );
    _ensureActive();

    if (pending.isEmpty) return;
    _logger.fine('Pending seen entries: ${pending.length}');

    Object? firstError;
    StackTrace? firstStackTrace;

    for (final entry in pending) {
      _ensureActive();

      try {
        await remoteRepo.markSystemNotificationAsSeen(entry.notificationId);
      } catch (e, s) {
        // The entry stays pending and untouched. Giving up belongs to nobody
        // here: a receipt is worth retrying for as long as polling is willing
        // to retry, and a per-entry attempt count would be spent by whatever
        // happens to trigger a cycle - a burst of taps would abandon an entry
        // in seconds, which is the failure this migration set out to remove.
        _logger.warning('Sending seen notification ${entry.notificationId} failed', e, s);
        firstError ??= e;
        firstStackTrace ??= s;
        continue;
      }

      _ensureActive();
      await localRepo.upsertOutboxNotification(entry.toSent());
      _logger.fine('Seen notification sent: ${entry.notificationId}');
    }

    if (firstError != null) {
      Error.throwWithStackTrace(firstError, firstStackTrace!);
    }
  }

  /// Drops an entry the backend has confirmed.
  ///
  /// Confirmation arrives through the sync worker: the notification comes back
  /// with `seen` set, which means the queued action no longer has anything to
  /// carry - including when another device sent it.
  void _onLocalEvent(SystemNotificationEvent event) {
    if (_disposed) return;
    if (event is SystemNotificationUpdate && event.notification.seen) {
      localRepo.deleteOutboxNotification(event.notification.id, SnOutboxActionType.seen);
    }
  }

  // In-flight I/O cannot be cancelled, but a retired worker must not start
  // another request or write after an async boundary.
  void _ensureActive() {
    if (_disposed) {
      throw StateError('Cannot refresh a disposed system notifications outbox worker.');
    }
  }

  bool _disposed = false;

  @override
  Future<void> dispose() async {
    if (_disposed) return;

    _logger.info('Disposing');
    _disposed = true;
    await _confirmationsSub.cancel();
  }
}
