import 'dart:async';

import 'package:clock/clock.dart';
// ignore: depend_on_referenced_packages
import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_phone/services/services.dart';
import 'package:webtrit_phone/utils/utils.dart';

import '../mocks/fake_connectivity_service.dart';
import '../mocks/mock_refreshable_repository.dart';

class _CountingJitter implements Jitter {
  int calls = 0;

  @override
  Duration add(Duration base) {
    calls++;
    return base + const Duration(seconds: 2);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FakeConnectivityService connectivity;
  late PollingService service;

  PollingTaskHandle start(
    FakeAsync async,
    MockRefreshableRepository task, {
    Duration interval = const Duration(seconds: 10),
    Duration cap = const Duration(seconds: 30),
    Jitter? jitter,
  }) {
    connectivity = FakeConnectivityService(initialConnected: true);
    service = PollingService(
      connectivityService: connectivity,
      options: PollingOptions(jitterRatio: 0, leadingRefreshMinAgeCap: cap),
      jitter: jitter,
    );
    final handle = service.register(PollingRegistration(listener: task, interval: interval));
    async.flushMicrotasks();
    return handle;
  }

  void reconnect(FakeAsync async) {
    connectivity.setConnected(false);
    async.flushMicrotasks();
    connectivity.setConnected(true);
    async.flushMicrotasks();
  }

  tearDown(() async {
    await service.dispose();
    await connectivity.dispose();
  });

  test('10-second polling survives flaps every 6 seconds without extra calls or starvation', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository(now: clock.now);
      final handle = start(async, task);
      final initial = clock.now();
      for (var i = 0; i < 5; i++) {
        async.elapse(const Duration(seconds: 6));
        reconnect(async);
        expect(handle.state.phase, PollingTaskPhase.succeeded);
      }
      expect(task.callTimestamps.map((time) => time.difference(initial).inSeconds), [0, 10, 20, 30]);
    });
  });

  test('fresh resume preserves completion state and the sampled periodic deadline', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      final jitter = _CountingJitter();
      final handle = start(async, task, jitter: jitter);
      final completed = handle.state;
      async.elapse(const Duration(seconds: 3));
      service.didChangeAppLifecycleState(AppLifecycleState.paused);
      async.elapse(const Duration(seconds: 3));
      service.didChangeAppLifecycleState(AppLifecycleState.resumed);
      async.flushMicrotasks();
      expect(task.calls, 1);
      expect(handle.state, same(completed));
      expect(jitter.calls, 1);
      async.elapse(const Duration(seconds: 5, milliseconds: 999));
      expect(task.calls, 1);
      async.elapse(const Duration(milliseconds: 1));
      expect(task.calls, 2);
    });
  });

  test('registering another task leaves a fresh task and its active timer alone', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      start(async, task);
      async.elapse(const Duration(seconds: 6));
      final other = MockRefreshableRepository();
      service.register(PollingRegistration(listener: other, interval: const Duration(minutes: 1)));
      async.flushMicrotasks();
      expect(task.calls, 1);
      expect(other.calls, 1);
      async.elapse(const Duration(seconds: 4));
      expect(task.calls, 2);
    });
  });

  for (final cap in [0, 5, 30]) {
    test('cap $cap uses an inclusive stale boundary for a long-interval task', () {
      fakeAsync((async) {
        final task = MockRefreshableRepository();
        final handle = start(
          async,
          task,
          interval: const Duration(minutes: 5),
          cap: Duration(seconds: cap),
        );
        final completed = handle.state;
        if (cap > 0) {
          async.elapse(Duration(seconds: cap) - const Duration(milliseconds: 1));
          reconnect(async);
          expect(task.calls, 1);
          expect(handle.state, same(completed));
          async.elapse(const Duration(milliseconds: 1));
        }
        reconnect(async);
        expect(task.calls, 2);
      });
    });
  }

  test('freshness starts at completion, including completion while offline', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository(workTime: const Duration(seconds: 8));
      final handle = start(async, task);
      async.elapse(const Duration(seconds: 5));
      connectivity.setConnected(false);
      async.flushMicrotasks();
      async.elapse(const Duration(seconds: 7));
      connectivity.setConnected(true);
      async.flushMicrotasks();
      expect(task.calls, 1);
      expect(handle.state.phase, PollingTaskPhase.succeeded);
      async.elapse(const Duration(seconds: 6));
      expect(task.calls, 2, reason: 'periodic deadline is completion at 8s + 10s');
    });
  });

  test('in-flight reconnect joins, while due invalidation still gets a trailing cycle', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository(workTime: const Duration(seconds: 4));
      final handle = start(async, task);
      reconnect(async);
      handle.invalidate();
      async.flushMicrotasks();
      expect(task.calls, 1);
      async.elapse(const Duration(seconds: 4));
      expect(task.calls, 2);
      async.elapse(const Duration(seconds: 4));
      expect(task.calls, 2);
    });
  });

  test('manual refresh and due invalidation bypass freshness; deferred invalidation keeps its deadline', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      final handle = start(async, task);
      unawaited(handle.runNow());
      async.flushMicrotasks();
      expect(task.calls, 2);
      handle.invalidate(after: const Duration(seconds: 4));
      async.elapse(const Duration(seconds: 2));
      reconnect(async);
      expect(task.calls, 2);
      async.elapse(const Duration(seconds: 2));
      expect(task.calls, 3);
      connectivity.setConnected(false);
      async.flushMicrotasks();
      handle.invalidate();
      async.flushMicrotasks();
      connectivity.setConnected(true);
      async.flushMicrotasks();
      expect(task.calls, 4);
    });
  });

  test('a failure after success at the same timestamp is never treated as fresh', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      final handle = start(async, task);
      task.failTimes = 1;
      unawaited(handle.runNow().catchError((Object _) {}));
      async.flushMicrotasks();
      expect(handle.state.lastFailureAt, handle.state.lastSuccessAt);
      expect(handle.state.phase, PollingTaskPhase.failed);
      reconnect(async);
      expect(task.calls, 3);
      expect(handle.state.phase, PollingTaskPhase.succeeded);
    });
  });

  test('first failure is retried on reconnect and inactive fresh tasks are unregistered', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository(failTimes: 1);
      final handle = start(async, task);
      reconnect(async);
      expect(task.calls, 2);
      task.active = false;
      reconnect(async);
      expect(handle.isRegistered, isFalse);
      expect(task.calls, 2);
    });
  });

  test('overdue reconnect executes once and schedules from that completion', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      start(async, task);
      connectivity.setConnected(false);
      async.flushMicrotasks();
      async.elapse(const Duration(minutes: 2));
      connectivity.setConnected(true);
      async.flushMicrotasks();
      expect(task.calls, 2);
      async.elapse(const Duration(seconds: 9, milliseconds: 999));
      expect(task.calls, 2);
      async.elapse(const Duration(milliseconds: 1));
      expect(task.calls, 3);
    });
  });

  test('freshness is checked after a slow reachability probe', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      start(async, task, interval: const Duration(minutes: 5));
      async.elapse(const Duration(seconds: 29));
      connectivity.nextCheckDelay = const Duration(seconds: 2);
      service.didChangeAppLifecycleState(AppLifecycleState.paused);
      service.didChangeAppLifecycleState(AppLifecycleState.resumed);
      async.flushMicrotasks();
      expect(task.calls, 1);
      async.elapse(const Duration(seconds: 2));
      expect(task.calls, 2);
    });
  });

  test('expiring the cap alone does not trigger a refresh', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      start(async, task, interval: const Duration(minutes: 5));
      async.elapse(const Duration(seconds: 31));
      expect(task.calls, 1);
      reconnect(async);
      expect(task.calls, 2);
    });
  });

  test('a slow manual cycle replaces the periodic tick due during its execution', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository(workTime: const Duration(seconds: 3));
      final handle = start(async, task);
      async.elapse(const Duration(seconds: 12));
      unawaited(handle.runNow());
      async.flushMicrotasks();
      expect(task.calls, 2);
      async.elapse(const Duration(seconds: 3));
      expect(task.calls, 2);
      expect(handle.state.phase, PollingTaskPhase.succeeded);
      async.elapse(const Duration(seconds: 9, milliseconds: 999));
      expect(task.calls, 2);
      async.elapse(const Duration(milliseconds: 1));
      expect(task.calls, 3);
    });
  });

  test('clock rollback does not label a future success timestamp as fresh', () {
    fakeAsync((async) {
      final task = MockRefreshableRepository();
      start(async, task);
      final beforeSuccess = clock.now().subtract(const Duration(seconds: 1));
      withClock(Clock.fixed(beforeSuccess), () {
        service.didChangeAppLifecycleState(AppLifecycleState.paused);
        service.didChangeAppLifecycleState(AppLifecycleState.resumed);
        async.flushMicrotasks();
      });
      expect(task.calls, 2);
    });
  });

  test('direct service construction rejects a negative cap', () {
    fakeAsync((async) {
      start(async, MockRefreshableRepository());
      expect(
        () => PollingService(
          connectivityService: connectivity,
          options: const PollingOptions(leadingRefreshMinAgeCap: Duration(seconds: -1)),
        ),
        throwsArgumentError,
      );
    });
  });
}
