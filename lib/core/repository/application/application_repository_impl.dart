import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';

@Injectable(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  ApplicationRepositoryImpl({
    required this.firebaseStorage,
    required this.httpDatasource,
  });

  final FirebaseStorage firebaseStorage;
  final HttpDatasource httpDatasource;

  @override
  Future<ApplicationDTO> createApplication(ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.createApplications(applicationDTO);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ApplicationDTO>> getUserApplications() async {
    try {
      return await httpDatasource.getApplications();
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future deleteApplication(String applicationId) async {
    try {
      return await httpDatasource.deleteApplications(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.updateApplications(applicationId, applicationDTO);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> getApplication(String id) async {
    try {
      return await httpDatasource.getApplication(id);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    try {
      return await httpDatasource.incApplicationVersion(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<String> uploadGoogleService(Uint8List service, String name) async {
    final storageRef = firebaseStorage.ref();
    final mountainImagesRef = storageRef.child('google-services/$name');
    final res = await mountainImagesRef.putData(service);
    return res.ref.getDownloadURL();
  }
}
