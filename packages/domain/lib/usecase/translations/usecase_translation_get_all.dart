import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsGetAll {
  Future<List<Translation>> execute();
}

@Injectable(as: UsecaseTranslationsGetAll)
class UsecaseTranslationsGetAllImpl extends UsecaseTranslationsGetAll {
  UsecaseTranslationsGetAllImpl({required this.translationsRepository});

  final TranslationsRepository translationsRepository;

  @override
  Future<List<Translation>> execute() async {
    return translationsRepository.getTranslations();
  }
}
