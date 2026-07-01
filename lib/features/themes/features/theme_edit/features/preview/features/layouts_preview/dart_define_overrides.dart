// Shared dart-define override logic for the realtime preview.
//
// The realtime preview boots the real app against the application's saved
// environment (the WEBTRIT_APP_* dart-define values). On top of that, the user
// can layer temporary, in-preview overrides that are never persisted to the
// backend. Both the preview launcher and the override editor build the effective
// map through resolveDartDefineOverrides so the merge rules stay in one place.

/// Metadata for a single dart-define field shown in the override editor.
class DartDefineField {
  const DartDefineField(this.key, this.label, {this.options});

  /// The `WEBTRIT_APP_*` dart-define key.
  final String key;

  /// Human-readable label shown in the editor.
  final String label;

  /// When non-null, the field is edited as a fixed-choice dropdown (e.g.
  /// boolean flags exposed as `true` / `false`).
  final List<String>? options;
}

/// Boolean dart-define values are passed as the strings `true` / `false`.
const List<String> _boolOptions = ['true', 'false'];

/// Catalog of dart-define keys exposed in the realtime preview override editor,
/// mirroring the keys configured in the application environment screen.
const List<DartDefineField> kDartDefineFields = [
  DartDefineField('WEBTRIT_APP_NAME', 'App name'),
  DartDefineField('WEBTRIT_APP_GREETING', 'App greeting'),
  DartDefineField('WEBTRIT_APP_ABOUT_URL', 'App about URL'),
  DartDefineField('WEBTRIT_APP_CREDENTIALS_REQUEST_URL', 'Credentials request URL'),
  DartDefineField('WEBTRIT_APP_SALES_EMAIL', 'Sales email'),
  DartDefineField('WEBTRIT_APP_CORE_URL', 'Core URL'),
  DartDefineField('WEBTRIT_APP_DEMO_CORE_URL', 'Demo core URL'),
  DartDefineField('WEBTRIT_APP_CORE_VERSION_CONSTRAINT', 'Core version constraint'),
  DartDefineField('WEBTRIT_APP_ENABLE_ATTENDED_TRANSFER', 'Enable attended transfer', options: _boolOptions),
  DartDefineField('WEBTRIT_APP_CONNECTIVITY_CHECK_URL', 'Connectivity check URL'),
  DartDefineField('WEBTRIT_APP_LINK_DOMAIN', 'Deep link domain'),
  DartDefineField('WEBTRIT_APP_DEBUG_LEVEL', 'Debug level'),
  DartDefineField('WEBTRIT_APP_DATABASE_LOG_STATEMENTS', 'Database log statements', options: _boolOptions),
  DartDefineField('WEBTRIT_APP_FCM_VAPID_KEY', 'FCM VAPID key'),
  DartDefineField('WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_URL', 'Logz.io logging URL'),
  DartDefineField('WEBTRIT_APP_REMOTE_LOGZIO_LOG_LEVEL', 'Logz.io log level'),
  DartDefineField('WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_TOKEN', 'Logz.io logging token'),
  DartDefineField('WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_BUFFER_SIZE', 'Logz.io logging buffer size'),
  DartDefineField('WEBTRIT_CALL_TRIGGER_MECHANISM_SMS', 'SMS call trigger', options: _boolOptions),
  DartDefineField('WEBTRIT_CALL_TRIGGER_MECHANISM_SMS_PREFIX', 'SMS call trigger prefix'),
];

/// Builds the effective dart-define override map for the realtime preview.
///
/// Precedence, lowest to highest: [defaults] (preview-supplied fallbacks such as
/// the web bundle id), the application's saved [environment] (null values
/// dropped), then the [temporary] in-preview overrides — so a temporary value
/// always wins, and a saved value always wins over a default.
Map<String, String> resolveDartDefineOverrides({
  required Map<String, dynamic> environment,
  required Map<String, String> temporary,
  Map<String, String> defaults = const {},
}) {
  return {
    ...defaults,
    for (final entry in environment.entries)
      if (entry.value != null) entry.key: '${entry.value}',
    ...temporary,
  };
}
