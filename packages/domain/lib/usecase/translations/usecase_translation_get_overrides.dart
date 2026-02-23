import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsGetOverridesByAppId {
  Future<List<Translation>> execute(String appId);
}

@Injectable(as: UsecaseTranslationsGetOverridesByAppId)
class UsecaseTranslationsGetOverridesByAppIdImpl
    extends UsecaseTranslationsGetOverridesByAppId {
  UsecaseTranslationsGetOverridesByAppIdImpl({
    required this.translationsRepository,
  });

  final TranslationsRepository translationsRepository;

  @override
  Future<List<Translation>> execute(String appId) async {
    return translationsRepository.getOverridesByAppId(appId);
  }
}
