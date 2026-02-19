import 'dart:async';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

final _logger = Logger('GetCallkeepBranchesUsecase');

abstract class GetCallkeepBranchesUsecase {
  Future<List<CallkeepBranch>> execute();
}

@LazySingleton(as: GetCallkeepBranchesUsecase)
class GetCallkeepBranchesUsecaseImpl extends GetCallkeepBranchesUsecase {
  GetCallkeepBranchesUsecaseImpl({
    required this.deploymentRepository,
  });

  final DeploymentRepository deploymentRepository;

  @override
  Future<List<CallkeepBranch>> execute() async {
    try {
      final callkeepBranches = await deploymentRepository.getCallkeepBranches();

      callkeepBranches.sort((a, b) {
        final aIndex = CallkeepBranchType.values.indexOf(a.type);
        final bIndex = CallkeepBranchType.values.indexOf(b.type);

        final effectiveAIndex = aIndex != -1 ? aIndex : CallkeepBranchType.values.length;
        final effectiveBIndex = bIndex != -1 ? bIndex : CallkeepBranchType.values.length;

        return effectiveAIndex.compareTo(effectiveBIndex);
      });

      return callkeepBranches;
    } catch (e, stackTrace) {
      _logger.severe('Failed to get callkeep branches', e, stackTrace);
      rethrow;
    }
  }
}
