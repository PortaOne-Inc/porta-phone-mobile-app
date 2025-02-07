part of 'environment_cubit.dart';

enum EnvironmentStatus {
  initial,
  loading,
  error;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isError => this == error;
}

@freezed
class EnvironmentState with _$EnvironmentState {
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
      appDescriptionKeyName,
      coreUrlKeyName,
      demoCoreUrlKeyName,
      coreVersionConstraintKeyName,
      remoteLogzioLoggingUrlKeyName,
      remoteLogzioLoggingTokenKeyName,
      remoteLogzioLoggingBufferSizeKeyName,
      appHelpUrlKeyName,
      appAboutUrlKeyName,
      appCredentialsRequestUrlKeyName,
    };

    return Map<String, dynamic>.from(environment)..removeWhere((key, _) => excludedKeys.contains(key));
  }

  String get appNameKeyName => 'WEBTRIT_APP_NAME';

  String get appDescriptionKeyName => 'WEBTRIT_APP_DESCRIPTION';

  String get coreUrlKeyName => 'WEBTRIT_APP_CORE_URL';

  String get demoCoreUrlKeyName => 'WEBTRIT_APP_DEMO_CORE_URL';

  String get coreVersionConstraintKeyName => 'WEBTRIT_APP_CORE_VERSION_CONSTRAINT';

  String get remoteLogzioLoggingUrlKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_URL';

  String get remoteLogzioLoggingTokenKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_TOKEN';

  String get remoteLogzioLoggingBufferSizeKeyName => 'WEBTRIT_APP_REMOTE_LOGZIO_LOGGING_BUFFER_SIZE';

  String get appHelpUrlKeyName => 'WEBTRIT_APP_HELP_URL';

  String get appAboutUrlKeyName => 'WEBTRIT_APP_ABOUT_URL';

  String get appCredentialsRequestUrlKeyName => 'WEBTRIT_APP_CREDENTIALS_REQUEST_URL';
}
