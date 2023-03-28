import 'package:webtrit_configurator/share/share.dart';

abstract class UsecaseThemeUploadImage {
  Future<String?> execute({
   required ImageModel? imageModel,
  });
}
