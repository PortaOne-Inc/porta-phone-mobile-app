import 'package:injectable/injectable.dart';

import 'package:data/dto/dto.dart';
import 'package:domain/domain.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<CallkeepBranch, CallkeepBranchDto>)
class CallkeepBranchMapper
    extends CommonMapper<CallkeepBranch, CallkeepBranchDto> {
  @override
  CallkeepBranch convertFrom(CallkeepBranchDto it) {
    final name = it.name;
    final type = _determineType(name);

    return CallkeepBranch(name: name, type: type);
  }

  CallkeepBranchType _determineType(String name) {
    if (name == 'main') {
      return CallkeepBranchType.main;
    } else if (name == 'develop') {
      return CallkeepBranchType.develop;
    } else if (name.startsWith('release-')) {
      return CallkeepBranchType.release;
    } else {
      return CallkeepBranchType.regular;
    }
  }
}
