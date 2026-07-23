import 'package:injectable/injectable.dart';

import 'package:data/dto/dto.dart';
import 'package:domain/domain.dart';

import '../mapper.dart';

@Injectable(as: CommonMapper<PhoneBranch, PhoneBranchDto>)
class PhoneBranchMapper extends CommonMapper<PhoneBranch, PhoneBranchDto> {
  @override
  PhoneBranch convertFrom(PhoneBranchDto it) {
    final name = it.name;
    final type = _determineType(name);

    return PhoneBranch(name: name, type: type);
  }

  PhoneBranchType _determineType(String name) {
    if (name == 'main') {
      return PhoneBranchType.main;
    } else if (name == 'develop') {
      return PhoneBranchType.develop;
    } else if (name.startsWith('release-')) {
      return PhoneBranchType.release;
    } else {
      return PhoneBranchType.regular;
    }
  }
}
