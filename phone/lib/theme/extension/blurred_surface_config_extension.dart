import 'package:theme_schema/theme_schema.dart';

import 'package:webtrit_phone/widgets/blurred_surface.dart';

import 'theme_json_serializable.dart';

extension BlurredSurfaceConfigExtension on BlurredSurfaceConfig {
  BlurredSurfaceStyle toStyle() {
    return BlurredSurfaceStyle(color: color?.toColor(), sigmaX: sigmaX, sigmaY: sigmaY);
  }
}
