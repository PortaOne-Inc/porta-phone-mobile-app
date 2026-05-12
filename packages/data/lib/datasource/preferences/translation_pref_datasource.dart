import 'package:injectable/injectable.dart';

import '../storage/storage.dart';

@lazySingleton
class TranslationPrefDatasource {
  TranslationPrefDatasource(this.storage);

  final LocalStorage storage;

  static const _activeLocalesKey = 'TRANSLATION_ACTIVE_LOCALES_KEY';
  static const _defaultLocales = {'en', 'uk', 'it'};

  Future<void> saveActiveLocales(Set<String> locales) async {
    await storage.setString(_activeLocalesKey, locales.join(','));
  }

  Set<String> loadActiveLocales() {
    final raw = storage.getString(_activeLocalesKey);
    if (raw == null || raw.isEmpty) return Set.unmodifiable(_defaultLocales);
    return Set.unmodifiable(raw.split(',').where((e) => e.isNotEmpty).toSet());
  }
}
