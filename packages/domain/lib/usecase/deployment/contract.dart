import 'package:domain/entity/models/models.dart';

abstract class UsecaseDeployBuilds {
  Future<void> execute({
    required String applicationId,
    required ApplicationDeploy applicationDeploy,
  });
}
