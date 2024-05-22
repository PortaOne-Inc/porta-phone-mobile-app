import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_dependency_branches.freezed.dart';

const String _kDefaultPhoneMainSourceBranch = 'beta/main';
const String _kDefaultPhoneBetaSourceBranch = 'beta/beta';
const String _kDefaultPhoneDevelopSourceBranch = 'beta/develop';
const String _kDefaultCallkeepSourceBranch = 'main';
const String _kDefaultCommonDependencySourceBranch = 'develop';
const String _kDefaultPhoneConfiguratorToolSourceBranch = 'develop';
const String _kDefaultKeystoreSourceBranch = 'main';

@freezed
class ApplicationDependencyBranches with _$ApplicationDependencyBranches {
  const factory ApplicationDependencyBranches({
    @Default(_kDefaultPhoneMainSourceBranch) String phoneSourceBranch,
    @Default(_kDefaultCallkeepSourceBranch) String callkeepSourceBranch,
    @Default(_kDefaultCommonDependencySourceBranch) String commonDependencySourceBranch,
    @Default(_kDefaultPhoneConfiguratorToolSourceBranch) String phoneConfiguratorToolSourceBranch,
    @Default(_kDefaultKeystoreSourceBranch) String keystoreSourceBranch,
  }) = _ApplicationDependencyBranches;

  const ApplicationDependencyBranches._();

  List<String> get defaultPhoneBranches => [
        _kDefaultPhoneMainSourceBranch,
        _kDefaultPhoneBetaSourceBranch,
        _kDefaultPhoneDevelopSourceBranch,
      ];

  List<String> get defaultCallkeepBranches => [
        _kDefaultCallkeepSourceBranch,
      ];

  List<String> get defaultCommonDependencyBranches => [
        _kDefaultCommonDependencySourceBranch,
      ];

  List<String> get defaultPhoneConfiguratorToolBranches => [
        _kDefaultPhoneConfiguratorToolSourceBranch,
      ];

  List<String> get defaultKeystoreBranches => [
        _kDefaultKeystoreSourceBranch,
      ];
}
