abstract class Refreshable {
  /// Runs one complete, finite refresh attempt.
  ///
  /// The returned future is the result contract for the caller:
  ///
  /// - complete normally when the required work succeeded;
  /// - complete normally when domain policy proves that no remote work is
  ///   required for this attempt;
  /// - throw the original error, with its stack trace, when attempted work
  ///   fails.
  ///
  /// Cached or fallback data may remain usable after a failed attempt, but that
  /// does not turn the attempt into a success. Logging or publishing an error
  /// to a feature stream is additional reporting and must not replace the
  /// thrown failure.
  ///
  /// Implementations own the domain decision about whether work is required
  /// and must await all work that belongs to the attempt, including durable
  /// persistence. Scheduling, connectivity gating, cross-cycle backoff, and
  /// task state belong to the caller.
  Future<void> refresh();

  /// Returns `false` when this refreshable has permanently stopped needing updates
  /// (e.g. the remote feature is not configured) and should be skipped or unregistered
  /// by polling and connectivity services.
  ///
  /// Defaults to `true`. Override to opt out of further refresh calls.
  bool get isActive => true;
}
