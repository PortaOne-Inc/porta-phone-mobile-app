// app_version_mapper.dart

import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import '../../dto/dto.dart';
import '../mapper.dart';

@Injectable(as: CommonMapper<AppVersion, BuildVersionModel>)
class AppVersionMapper extends CommonMapper<AppVersion, BuildVersionModel> {
  @override
  BuildVersionModel convertTo(AppVersion it) {
    if (it.appVersion == null || it.appVersion!.isEmpty) {
      return const BuildVersionModel(buildName: '0.0.0', buildNumber: 0);
    }

    // Split the appVersion string into buildName and buildNumber
    final parts = it.appVersion!.split('+');
    final buildName = parts[0];
    final buildNumber = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;

    return BuildVersionModel(buildName: buildName, buildNumber: buildNumber);
  }

  @override
  AppVersion convertFrom(BuildVersionModel it) {
    final buildName = it.buildName ?? '0.0.0';
    final buildNumber = it.buildNumber ?? 0;

    // Combine buildName and buildNumber into appVersion string
    final appVersion = '$buildName+$buildNumber';

    return AppVersion(appVersion);
  }
}
