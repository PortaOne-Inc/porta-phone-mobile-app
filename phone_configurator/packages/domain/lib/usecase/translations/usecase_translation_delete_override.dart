import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseTranslationsDeleteOverride {
  Future<void> execute(String appId, Translation translation);
}

@Injectable(as: UsecaseTranslationsDeleteOverride)
class UsecaseTranslationsDeleteOverrideImpl
    extends UsecaseTranslationsDeleteOverride {
  UsecaseTranslationsDeleteOverrideImpl({required this.translationsRepository});

  final TranslationsRepository translationsRepository;

  @override
  Future<void> execute(String appId, Translation translation) async {
    return translationsRepository.deleteOverrideByAppId(appId, translation);
  }
}
