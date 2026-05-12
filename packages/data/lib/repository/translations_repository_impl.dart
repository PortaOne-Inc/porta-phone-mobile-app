import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';
import 'package:data/mappers/mappers.dart';
import '../common/api_exception_mapper.dart';

@Injectable(as: TranslationsRepository)
class TranslationsRepositoryImpl extends TranslationsRepository {
  TranslationsRepositoryImpl(this._datasource, this._mapper, this._prefDatasource);

  final ConfiguratorBackandDatasource _datasource;
  final CommonMapper<Translation, TranslationHttpModel> _mapper;
  final TranslationPrefDatasource _prefDatasource;

  @override
  Future<List<Translation>> getTranslations() async {
    try {
      final models = await _datasource.getTranslations();
      return models.map(_mapper.convertFrom).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<Translation>> getOverridesByAppId(String appId) async {
    try {
      final models = await _datasource.getTranslationOverrides(appId);
      return models.map(_mapper.convertFrom).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> setOverrideByAppId(String appId, Translation translation) async {
    try {
      final model = _mapper.convertTo(translation);
      await _datasource.setTranslationOverride(appId, model);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteOverrideByAppId(String appId, Translation translation) async {
    try {
      final model = _mapper.convertTo(translation);
      await _datasource.deleteTranslationOverride(appId, model);
    } on DioException catch (e) {
      throw mapDioException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> saveActiveLocales(Set<String> locales) async {
    await _prefDatasource.saveActiveLocales(locales);
  }

  @override
  Set<String> loadActiveLocales() => _prefDatasource.loadActiveLocales();
}
