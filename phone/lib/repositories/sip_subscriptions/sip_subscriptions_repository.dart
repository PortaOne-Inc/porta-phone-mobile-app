import 'dart:async';

import 'package:logging/logging.dart';

import 'package:webtrit_phone/common/refreshable.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/services/services.dart';

import 'sip_subscriptions_local_data_source.dart';
import 'sip_subscriptions_remote_data_source.dart';

final _logger = Logger('SipSubscriptionsRepository');

abstract class SipSubscriptionsRepository {
  Stream<List<SipSubscription>> watchAll();

  Future<List<SipSubscription>> getAll();

  Future<void> upsert(SipSubscription item);

  Future<void> remove(SipSubscriptionType type, String number, {String? contactUserId});
}

/// Persists local edits and their outbox entries before best-effort sync.
///
/// A subsequent sync failure does not fail a saved edit. In contrast, [refresh]
/// reports the full sync outcome, including remote and local persistence errors.
class SipSubscriptionsRepositorySyncableImpl implements SipSubscriptionsRepository, Refreshable {
  SipSubscriptionsRepositorySyncableImpl({
    required SipSubscriptionsLocalDataSource localDataSource,
    required ConnectivityService connectivityService,
    required SipSubscriptionsRemoteDataSource remoteDataSource,
    this.remoteSyncEnabled = true,
  }) : _localRepository = localDataSource,
       _remoteRepository = remoteDataSource,
       _connectivityService = connectivityService;

  final SipSubscriptionsLocalDataSource _localRepository;
  final SipSubscriptionsRemoteDataSource _remoteRepository;
  final ConnectivityService _connectivityService;
  final bool remoteSyncEnabled;

  String? _etag;

  @override
  Stream<List<SipSubscription>> watchAll() {
    return _localRepository.watchAll();
  }

  @override
  Future<List<SipSubscription>> getAll() {
    return _localRepository.getAll();
  }

  @override
  Future<void> upsert(SipSubscription item) async {
    await _localRepository.upsert(item);

    await _localRepository.setOutboxAction(
      SipSubscriptionOutboxAction(
        action: SipSubscriptionOutboxActionType.upsert,
        type: item.type,
        number: item.number,
        contactUserId: item.contactUserId,
        sendAttempts: 0,
        timestampUsec: DateTime.now().microsecondsSinceEpoch,
      ),
      replacePrevAction: true,
    );

    await _maybeSyncAfterEdit();
  }

  @override
  Future<void> remove(SipSubscriptionType type, String number, {String? contactUserId}) async {
    var resolvedContactUserId = contactUserId;
    if (resolvedContactUserId == null) {
      final subscriptions = await _localRepository.getAll();
      for (final subscription in subscriptions) {
        if (subscription.type == type && subscription.number == number) {
          resolvedContactUserId = subscription.contactUserId;
          break;
        }
      }
    }

    await _localRepository.remove(type, number);

    await _localRepository.setOutboxAction(
      SipSubscriptionOutboxAction(
        action: SipSubscriptionOutboxActionType.delete,
        type: type,
        number: number,
        contactUserId: resolvedContactUserId,
        sendAttempts: 0,
        timestampUsec: DateTime.now().microsecondsSinceEpoch,
      ),
      replacePrevAction: true,
    );

    await _maybeSyncAfterEdit();
  }

  @override
  Future<void> refresh() async {
    if (!remoteSyncEnabled) return;

    try {
      final outbox = await _localRepository.getAllOutboxActions();
      if (outbox.isEmpty) {
        await _pullRemoteSubscriptions();
      } else {
        await _pushPullChanges(outbox);
      }
    } catch (e, s) {
      _logger.warning('Failed to refresh sip subscriptions', e, s);
      rethrow;
    }
  }

  Future<void> _maybeSyncAfterEdit() async {
    if (remoteSyncEnabled == false) return;
    if ((await _connectivityService.checkConnection()) == false) return;

    try {
      await refresh();
    } catch (_) {
      // The edit and its outbox entry are already persisted. Refresh logs the
      // failure; a later polling cycle retries without failing the local edit.
    }
  }

  Future<void> _pullRemoteSubscriptions() async {
    final result = await _remoteRepository.getSipSubscriptions(ifNoneMatch: _etag);
    if (result.notModified) {
      _logger.fine('Sip subscriptions not modified since last sync');
      return;
    }

    await _localRepository.batchReplace(result.items, removePrevious: true);
    _etag = result.etag;
  }

  Future<void> _pushPullChanges(List<SipSubscriptionOutboxAction> outbox) async {
    _logger.info('Syncing ${outbox.length} sip subscription changes from outbox');
    try {
      final result = await _remoteRepository.batchSyncSipSubscriptions(outbox);
      await Future.forEach(outbox, _localRepository.removeOutboxAction);
      await _localRepository.batchReplace(result.items, removePrevious: true);
      _etag = result.etag;
    } catch (_) {
      try {
        await _handleOutboxSyncFailure(outbox);
      } catch (e, s) {
        // Failure bookkeeping must not replace the original sync error.
        _logger.warning('Failed to record sip subscriptions outbox attempt', e, s);
      }
      rethrow;
    }
  }

  Future<void> _handleOutboxSyncFailure(List<SipSubscriptionOutboxAction> outbox) async {
    final outboxAfterAttempt = outbox.map((e) => e.copyWith(sendAttempts: e.sendAttempts + 1));
    for (final action in outboxAfterAttempt) {
      if (action.sendAttempts > 5) {
        _logger.warning('Dropping outbox entry after 5 attempts: ${action.number} (${action.type})');
        await _localRepository.removeOutboxAction(action);
      } else {
        await _localRepository.setOutboxAction(action);
      }
    }
  }

  @override
  bool get isActive => true;
}
