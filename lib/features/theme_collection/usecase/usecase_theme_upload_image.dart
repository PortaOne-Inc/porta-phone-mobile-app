import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseThemeUploadImage {
  Future<String?> execute({
   required ImageModel? imageModel,
  });
}
