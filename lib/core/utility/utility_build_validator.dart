class UtilityBuildValidator {
  final _versionValidator = VersionValidator();

  final _platformIdentifierRegex = RegExp(
    r'^[a-zA-Z]+[a-zA-Z0-9_]*(\.[a-zA-Z]+[a-zA-Z0-9_]*)*$',
  );
  final _urlRegex = RegExp(r'^(https?|ftp)://[^\s/$.?#].\S*$');

  bool isBuildVersionNameValid(String? name) =>
      _versionValidator.isValidVersionName(name ?? '');

  bool isBuildVersionNumberValid(int? number) =>
      _versionValidator.isValidBuildNumber(number?.toString() ?? '');

  bool isPlatformIdentifierValid(String? packageName) =>
      _platformIdentifierRegex.hasMatch(packageName ?? '');

  bool isValidUrl(String? url) => _urlRegex.hasMatch(url ?? '');
}

class VersionValidator {
  static final RegExp versionNameRegExp = RegExp(r'^\d+\.\d+\.\d+$');

  // Validate version name in the format a.b.c
  bool isValidVersionName(String versionName) =>
      versionNameRegExp.hasMatch(versionName);

  // Validate build number: any non-negative integer (monotonic counter,
  // independent of the version name).
  bool isValidBuildNumber(String buildNumber) {
    final value = int.tryParse(buildNumber);
    return value != null && value >= 0;
  }
}
