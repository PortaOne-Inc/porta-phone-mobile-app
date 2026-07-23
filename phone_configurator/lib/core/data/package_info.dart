import 'package:package_info_plus/package_info_plus.dart' as plugin;

class PackageInfo {
  PackageInfo(this._pluginPackageInfo);

  final plugin.PackageInfo _pluginPackageInfo;

  static Future<PackageInfo> init() async {
    return PackageInfo(await plugin.PackageInfo.fromPlatform());
  }

  String get appName => _pluginPackageInfo.appName;

  String get packageName => _pluginPackageInfo.packageName;

  String get version => _pluginPackageInfo.version;

  String get buildNumber => _pluginPackageInfo.buildNumber;
}
