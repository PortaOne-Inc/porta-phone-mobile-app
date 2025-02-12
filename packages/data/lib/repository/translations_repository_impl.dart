import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/entity/entities/translation.dart';
import 'package:domain/exception/exception.dart';

import 'package:data/mappers/mappers.dart';
import 'package:data/datasource/datasource.dart';

@Injectable(as: TranslationsRepository)
class TranslationsRepositoryImpl extends TranslationsRepository {
  TranslationsRepositoryImpl(
    this.configuratorBackandDatasource,
  );

  final ConfiguratorBackandDatasource configuratorBackandDatasource;

  @override
  Future<List<Translation>> getTranslations() async {
    try {
      final models = await configuratorBackandDatasource.getTranslations();
      return models.map(TranslationHttpMapper.fromHttpModel).toList();
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<Translation>> getOverridesByAppId(String appId) async {
    try {
      final models = await configuratorBackandDatasource.getTranslationOverrides(appId);
      return models.map(TranslationHttpMapper.fromHttpModel).toList();
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> setOverrideByAppId(String appId, Translation translation) async {
    try {
      await configuratorBackandDatasource.setTranslationOverride(appId, TranslationHttpMapper.toHttpModel(translation));
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteOverrideByAppId(String appId, Translation translation) async {
    try {
      await configuratorBackandDatasource.deleteTranslationOverride(
        appId,
        TranslationHttpMapper.toHttpModel(translation),
      );
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
