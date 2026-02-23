import 'package:freezed_annotation/freezed_annotation.dart';

import 'callkeep_branch.dart';
import 'phone_branch.dart';

part 'application_dependency_branches.freezed.dart';

const String _kDefaultPhoneMainSourceBranch = 'main';
const String _kDefaultCallkeepSourceBranch = 'main';
const String _kConfiguratorSourceBranch = 'develop';
const String _kDefaultPhoneConfiguratorToolSourceBranch = 'main';
const String _kDefaultKeystoreSourceBranch = 'main';

@freezed
sealed class ApplicationDependencyBranches
    with _$ApplicationDependencyBranches {
  const factory ApplicationDependencyBranches({
    @Default([]) List<PhoneBranch> phoneBranches,
    @Default([]) List<CallkeepBranch> callkeepBranches,
    @Default(_kDefaultPhoneMainSourceBranch) String phoneSourceBranch,
    @Default(_kDefaultCallkeepSourceBranch) String callkeepSourceBranch,
    @Default(_kConfiguratorSourceBranch) String configuratorSourceBranch,
    @Default(_kDefaultPhoneConfiguratorToolSourceBranch)
    String phoneConfiguratorToolSourceBranch,
    @Default(_kDefaultKeystoreSourceBranch) String keystoreSourceBranch,
  }) = _ApplicationDependencyBranches;

  const ApplicationDependencyBranches._();

  List<String> get defaultConfiguratorBranches => [_kConfiguratorSourceBranch];

  List<String> get defaultPhoneConfiguratorToolBranches => [
    _kDefaultPhoneConfiguratorToolSourceBranch,
  ];

  List<String> get defaultKeystoreBranches => [_kDefaultKeystoreSourceBranch];
}
