import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_phone/utils/jitter.dart';

void main() {
  group('RandomJitter', () {
    test('default upper bound scales to ten percent of the base duration', () {
      final random = _UpperBoundRandom();
      final jitter = RandomJitter(random: random);

      expect(jitter.add(const Duration(seconds: 10)), const Duration(milliseconds: 10999));
      expect(jitter.add(const Duration(minutes: 5)), const Duration(milliseconds: 329999));
      expect(random.maxima, [1000, 30000]);
    });

    test('zero ratio leaves the base duration unchanged', () {
      final random = _UpperBoundRandom();
      final jitter = RandomJitter(maxRatio: 0, random: random);

      expect(jitter.add(const Duration(minutes: 5)), const Duration(minutes: 5));
      expect(random.maxima, isEmpty);
    });
  });
}

class _UpperBoundRandom implements Random {
  final List<int> maxima = [];

  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 1;

  @override
  int nextInt(int max) {
    maxima.add(max);
    return max - 1;
  }
}
