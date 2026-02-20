part of 'environment_cubit.dart';

enum EnvironmentStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isError => this == error;
}

@freezed
sealed class EnvironmentState with _$EnvironmentState {
  factory EnvironmentState({
    required String applicationId,
    @Default(EnvironmentStatus.initial) EnvironmentStatus status,
    @Default({}) Map<String, dynamic> environment,
    String? errorMessage,
  }) = _EnvironmentState;

  EnvironmentState._();

  Map<String, dynamic> get filteredEnvironment {
    final excludedKeys = {
      appNameKeyName,
      appGreetingKeyName,
      appAboutUrlKeyName,
      appCredentialsRequestUrlKeyName,
      salesEmailKeyName,
      coreUrlKeyName,
      demoCoreUrlKeyName,
      coreVersionConstraintKeyName,
      enableAttendedTransferKeyName,
      fcmVapidKeyKeyName,
      remoteLogzioLoggingUrlKeyName,
      remoteLogzioLogLevelKeyName,
      remoteLogzioLoggingTokenKeyName,
      remoteLogzioLoggingBufferSizeKeyName,
      callTriggerMechanismSmsKeyName,
      callTriggerMechanismSmsPrefixKeyName,
      callTriggerMechanismSmsRegexPatternKeyName,
      connectivityCheckUrlKeyName,
      deeplinkDomain,
      logDebugLevel,
      logDatabaseLogStatements,
      userRepositoryPollingIntervalSecondsKeyName,
      systemInfoRepositoryPollingIntervalSecondsKeyName,
      externalContactsRepositoryPollingIntervalSecondsKeyName,
      voicemailRepositoryPollingIntervalSecondsKeyName,
      callerIdSettingsRepositoryPollingIntervalSecondsKeyName,
    };

    return Map<String, dynamic>.from(environment)..removeWhere((key, _) => excludedKeys.contains(key));
  }

  String get appNameKeyName => 'WEBTRIT_APP_NAME';

  String get appGreetingKeyName => 'WEBTRIT_APP_GREETING';

  String get appAboutUrlKeyName => 'WEBTRIT_APP_ABOUT_URL';

  String get appCredentialsRequestUrlKeyName => 'WEBTRIT_APP_CREDENTIALS_REQUEST_URL';

  String get salesEmailKeyName => 'WEBTRIT_APP_SALES_EMAIL';

  String get coreUrlKeyName => 'WEBTRIT_APP_CORE_URL';

  String get enableAttendedTransferKeyName => 'WEBTRIT_APP_ENABLE_ATTENDED_TRANSFER';

  String get demoCoreUrlKeyName => 'WEBTRIT_APP_DEMO_CORE_URL';

  String get coreVersionConstraintKeyName => 'WEBTRIT_APP_CORE_VERSION_CONSTRAINT';

  String get fcmVapidKeyKeyName => 'WEBTRIT_APP_FCM_VAPID_KEY';

  String get remoteLogzioLoggingUrlKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_URL';

  String get remoteLogzioLogLevelKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOG_LEVEL';

  String get remoteLogzioLoggingTokenKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_TOKEN';

  String get remoteLogzioLoggingBufferSizeKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_BUFFER_SIZE';

  String get callTriggerMechanismSmsKeyName => 'WEBTRIT_CALL_TRIGGER_MECHANISM_SMS';

  String get callTriggerMechanismSmsPrefixKeyName => 'WEBTRIT_CALL_TRIGGER_MECHANISM_SMS_PREFIX';

  String get callTriggerMechanismSmsRegexPatternKeyName => 'WEBTRIT_CALL_TRIGGER_MECHANISM_SMS_REGEX_PATTERN';

  String get connectivityCheckUrlKeyName => 'WEBTRIT_APP_CONNECTIVITY_CHECK_URL';

  String get deeplinkDomain => 'WEBTRIT_APP_LINK_DOMAIN';

  String get logDebugLevel => 'WEBTRIT_APP_DEBUG_LEVEL';

  String get logDatabaseLogStatements => 'WEBTRIT_APP_DATABASE_LOG_STATEMENTS';

  String get userRepositoryPollingIntervalSecondsKeyName => 'WEBTRIT_APP_USER_REPOSITORY_POLLING_INTERVAL_SECONDS';

  String get systemInfoRepositoryPollingIntervalSecondsKeyName =>
      'WEBTRIT_APP_SYSTEM_INFO_REPOSITORY_POLLING_INTERVAL_SECONDS';

  String get externalContactsRepositoryPollingIntervalSecondsKeyName =>
      'WEBTRIT_APP_EXTERNAL_CONTACTS_REPOSITORY_POLLING_INTERVAL_SECONDS';

  String get voicemailRepositoryPollingIntervalSecondsKeyName =>
      'WEBTRIT_APP_VOICEMAIL_REPOSITORY_POLLING_INTERVAL_SECONDS';

  String get callerIdSettingsRepositoryPollingIntervalSecondsKeyName =>
      'WEBTRIT_APP_CALLER_ID_SETTINGS_REPOSITORY_POLLING_INTERVAL_SECONDS';
}
