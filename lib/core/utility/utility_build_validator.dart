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
  static final RegExp versionNumberRegExp = RegExp(r'^\d+\.\d+\.\d+$');
  static final RegExp extendedVersionNameRegExp = RegExp(
    r'^\d+\.\d+\.\d+\+\d{6}[a-z]{4}$',
  );

  // Validate version name in the format a.b.c or a.b.c+abcxxxx
  bool isValidVersionName(String versionName) {
    if (versionNameRegExp.hasMatch(versionName)) {
      return true;
    }

    if (!extendedVersionNameRegExp.hasMatch(versionName)) {
      return false;
    }

    final parts = versionName.split('+');
    if (parts.length != 2) {
      return false;
    }

    final versionParts = parts[0].split('.');
    final abc = int.tryParse(parts[1].substring(0, 3)) ?? -1;
    final xxxx = parts[1].substring(3);

    if (versionParts.length != 3) {
      return false;
    }

    final a = int.tryParse(versionParts[0]) ?? -1;
    final b = int.tryParse(versionParts[1]) ?? -1;
    final c = int.tryParse(versionParts[2]) ?? -1;

    if (a < 0 ||
        b < 0 ||
        c < 0 ||
        abc < 0 ||
        int.tryParse(xxxx) == null ||
        int.parse(xxxx) >= 1000) {
      return false;
    }

    final versionNumber = a * 10000 + b * 100 + c;
    return abc >= versionNumber;
  }

  // Validate build number in the format xxxxxxxx
  bool isValidBuildNumber(String buildNumber) {
    if (buildNumber.length != 8 || int.tryParse(buildNumber) == null) {
      return false;
    }

    final a = int.tryParse(buildNumber.substring(0, 1)) ?? -1;
    final b = int.tryParse(buildNumber.substring(1, 2)) ?? -1;
    final c = int.tryParse(buildNumber.substring(2, 3)) ?? -1;
    final buildNum = int.tryParse(buildNumber.substring(3)) ?? -1;

    if (a < 0 || b < 0 || c < 0 || buildNum < 0) {
      return false;
    }

    return true;
  }
}
