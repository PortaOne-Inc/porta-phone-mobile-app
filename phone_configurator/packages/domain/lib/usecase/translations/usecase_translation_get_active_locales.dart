import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsGetActiveLocales {
  Set<String> execute();
}

@Injectable(as: UsecaseTranslationsGetActiveLocales)
class UsecaseTranslationsGetActiveLocalesImpl extends UsecaseTranslationsGetActiveLocales {
  UsecaseTranslationsGetActiveLocalesImpl({required this.translationsRepository});

  final TranslationsRepository translationsRepository;

  @override
  Set<String> execute() => translationsRepository.loadActiveLocales();
}
