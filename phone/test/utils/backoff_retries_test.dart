import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_phone/utils/backoff_retries.dart';

void main() {
  group('ExponentialBackoff', () {
    const backoff = ExponentialBackoff();
    const base = Duration(seconds: 5);

    test('doubles the base per consecutive error until the cap', () {
      expect(backoff.next(0, base), base);
      expect(backoff.next(1, base), const Duration(seconds: 10));
      expect(backoff.next(2, base), const Duration(seconds: 20));
      expect(backoff.next(3, base), const Duration(seconds: 40));
      expect(backoff.next(10, base, max: const Duration(minutes: 5)), const Duration(minutes: 5));
    });

    test('a long error streak stays capped instead of overflowing', () {
      const cap = Duration(minutes: 5);
      for (final errors in [31, 62, 63, 100]) {
        final delay = backoff.next(errors, base, max: cap);
        expect(delay.isNegative, isFalse, reason: '$errors consecutive errors must not overflow');
        expect(delay, cap, reason: '$errors consecutive errors must stay at the cap');
      }
    });

    for (final seconds in [300, 600, 1200]) {
      test('a ${seconds}s base is never shortened by the default 300s cap', () {
        final interval = Duration(seconds: seconds);
        for (final errors in [0, 1, 2, 31, 100]) {
          expect(backoff.next(errors, interval), interval);
        }
      });
    }

    test('an explicit cap below the base cannot shorten the interval', () {
      const policy = ExponentialBackoff(max: Duration(minutes: 15));
      const interval = Duration(minutes: 10);

      expect(policy.next(1, interval), const Duration(minutes: 15));
      expect(policy.next(1, interval, max: const Duration(minutes: 5)), interval);
      expect(policy.next(100, interval, max: const Duration(minutes: 5)), interval);
    });

    test('a larger cap allows growth and success restores the base', () {
      const interval = Duration(minutes: 5);
      const cap = Duration(minutes: 15);

      expect(backoff.next(1, interval, max: cap), const Duration(minutes: 10));
      expect(backoff.next(2, interval, max: cap), cap);
      expect(backoff.next(100, interval, max: cap), cap);
      expect(backoff.next(0, interval, max: cap), interval);
    });
  });
}
