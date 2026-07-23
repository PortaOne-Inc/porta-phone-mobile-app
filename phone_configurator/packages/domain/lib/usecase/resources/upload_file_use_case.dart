import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class UploadFileUsecase {
  Future<String> execute({required String fileName, required Uint8List data});
}

@Injectable(as: UploadFileUsecase)
class UploadFileUsecaseImpl implements UploadFileUsecase {
  UploadFileUsecaseImpl(this._resourcesRepository);

  final ResourcesRepository _resourcesRepository;

  @override
  Future<String> execute({required String fileName, required Uint8List data}) {
    return _resourcesRepository.putBytes('assets', fileName, data);
  }
}
