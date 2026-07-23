import 'package:domain/models/models.dart';

abstract class TranslationsRepository {
  Future<List<Translation>> getTranslations();
  Future<List<Translation>> getOverridesByAppId(String appId);
  Future<void> setOverrideByAppId(String appId, Translation translation);
  Future<void> deleteOverrideByAppId(String appId, Translation translation);
  Future<void> saveActiveLocales(Set<String> locales);
  Set<String> loadActiveLocales();
}
