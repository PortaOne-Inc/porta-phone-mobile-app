import 'package:freezed_annotation/freezed_annotation.dart';

part 'callkeep_branch.freezed.dart';

enum CallkeepBranchType { main, release, develop, regular }

@freezed
sealed class CallkeepBranch with _$CallkeepBranch {
  const factory CallkeepBranch({
    required String name,
    @Default(CallkeepBranchType.regular) CallkeepBranchType type,
  }) = _CallkeepBranch;

  const CallkeepBranch._();
}
