import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/entity/entity.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsSetOverride {
  Future<void> execute(String appId, Translation translation);
}

@Injectable(as: UsecaseTranslationsSetOverride)
class UsecaseTranslationsSetOverrideImpl extends UsecaseTranslationsSetOverride {
  UsecaseTranslationsSetOverrideImpl({required this.translationsRepository});

  final TranslationsRepository translationsRepository;

  @override
  Future<void> execute(String appId, Translation translation) async {
    return translationsRepository.setOverrideByAppId(appId, translation);
  }
}
