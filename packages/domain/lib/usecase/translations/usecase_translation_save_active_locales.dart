import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsSaveActiveLocales {
  Future<void> execute(Set<String> locales);
}

@Injectable(as: UsecaseTranslationsSaveActiveLocales)
class UsecaseTranslationsSaveActiveLocalesImpl extends UsecaseTranslationsSaveActiveLocales {
  UsecaseTranslationsSaveActiveLocalesImpl({required this.translationsRepository});

  final TranslationsRepository translationsRepository;

  @override
  Future<void> execute(Set<String> locales) => translationsRepository.saveActiveLocales(locales);
}
