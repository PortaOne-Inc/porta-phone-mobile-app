import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

@Injectable(as: VendorRepository)
class VendorRepositoryImpl extends VendorRepository {
  VendorRepositoryImpl({required this.datasource});

  final RealtimeFirebaseData datasource;

  final String _themesDirectoryName = 'applications';
  final String _appIdField = 'id';

  String _getApplicationsPath(String userId) => '$_themesDirectoryName/$userId/';

  String _getApplicationPath(String userId, String id) => '$_themesDirectoryName/$userId/$id';

  @override
  Future<VendorDTO> createApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return await _tryCreateApplication(applicationDTO, userId);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<VendorDTO>> getUserApplications(String userId) async {
    try {
      return await _tryGetUserApplications(userId);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<VendorDTO> deleteApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return _tryDeleteApplication(userId, applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<VendorDTO> updateApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return _tryUpdateApplication(userId, applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  Future<VendorDTO> _tryCreateApplication(VendorDTO applicationDTO, String userId) async {
    final inJson = applicationDTO.toJson();
    final id = await datasource.post(_getApplicationsPath(userId), inJson);
    final outJson = inJson..update(_appIdField, (value) => id, ifAbsent: () => id);
    return VendorDTO.fromJson(outJson);
  }

  Future<List<VendorDTO>> _tryGetUserApplications(String userId) async {
    final themes = await datasource.get<String, Map<String, dynamic>>(_getApplicationsPath(userId));
    return themes.map((it) {
      final raw = it.value..update(_appIdField, (value) => it.key, ifAbsent: () => it.key);
      return VendorDTO.fromJson(raw);
    }).toList();
  }

  Future<VendorDTO> _tryDeleteApplication(String userId, VendorDTO applicationDTO) async {
    await datasource.delete(_getApplicationPath(userId, applicationDTO.id!));
    return applicationDTO;
  }

  Future<VendorDTO> _tryUpdateApplication(String userId, VendorDTO applicationDTO) async {
    await datasource.patch(_getApplicationPath(userId, applicationDTO.id!), applicationDTO.toJson());
    return applicationDTO;
  }
}
