import 'dart:math';

/// An interface for adding jitter to a [Duration].
abstract class Jitter {
  /// Returns a new [Duration] with jitter added to the [base] duration.
  Duration add(Duration base);
}

/// Adds a random jitter to a [Duration].
///
/// The jitter is a random value from zero up to [maxRatio] of the base
/// duration.
class RandomJitter implements Jitter {
  /// Creates a [RandomJitter] with an optional [maxRatio] (default is 10%).
  RandomJitter({this.maxRatio = 0.1, Random? random})
    : assert(maxRatio >= 0 && maxRatio.isFinite),
      _rand = random ?? Random();

  /// The maximum jitter as a fraction of the base duration.
  final double maxRatio;

  /// The random number generator.
  final Random _rand;

  /// Returns [base] plus a random jitter below [maxRatio] of [base].
  @override
  Duration add(Duration base) {
    final maxJitterMs = (base.inMilliseconds * maxRatio).round();
    return maxJitterMs <= 0 ? base : base + Duration(milliseconds: _rand.nextInt(maxJitterMs));
  }
}

/// Does not add any jitter to a [Duration].
class NoJitter implements Jitter {
  /// Returns the [base] duration unchanged.
  @override
  Duration add(Duration base) => base;
}
