import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_edit.dart';

@Injectable(as: UsecaseApplicationEdit)
class UsecaseApplicationEditImpl extends UsecaseApplicationEdit {
  UsecaseApplicationEditImpl({
    required this.applicationRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({
    required ApplicationModel argument,
  }) async {
    final dto = await applicationRepository.updateApplication(argument.id!, mapper.mapToDto(argument));
    return mapper.mapToModel(dto);
  }
}
