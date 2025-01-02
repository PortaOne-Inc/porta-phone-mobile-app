import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class GetPhoneBranchesUsecase {
  Future<List<PhoneBranch>> execute();
}

@LazySingleton(as: GetPhoneBranchesUsecase)
class GetPhoneBranchesUsecaseImpl extends GetPhoneBranchesUsecase {
  GetPhoneBranchesUsecaseImpl({
    required this.deploymentRepository,
  });

  final DeploymentRepository deploymentRepository;

  @override
  Future<List<PhoneBranch>> execute() async {
    try {
      // Fetch the phone branches from the repository
      final phoneBranches = await deploymentRepository.getPhoneBranched();

      // Sort the branches based on the defined PhoneBranchType order
      phoneBranches.sort((a, b) {
        final aIndex = PhoneBranchType.values.indexOf(a.type);
        final bIndex = PhoneBranchType.values.indexOf(b.type);

        // Handle cases where a.type or b.type might not be in the _branchTypeOrder list
        final effectiveAIndex = aIndex != -1 ? aIndex : PhoneBranchType.values.length;
        final effectiveBIndex = bIndex != -1 ? bIndex : PhoneBranchType.values.length;

        return effectiveAIndex.compareTo(effectiveBIndex);
      });

      return phoneBranches;
    } catch (e, stackTrace) {
      // Log the error if necessary
      // For example, using a logging package like logger:
      // logger.error('Failed to get phone branches', e, stackTrace);

      // Re-throw the exception to be handled upstream
      throw Exception('Unable to fetch phone branches: $e');
    }
  }
}
