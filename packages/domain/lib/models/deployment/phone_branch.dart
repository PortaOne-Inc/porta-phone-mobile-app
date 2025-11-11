import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_branch.freezed.dart';

enum PhoneBranchType { main, release, develop, regular }

@freezed
sealed class PhoneBranch with _$PhoneBranch {
  const factory PhoneBranch({
    required String name,
    @Default(PhoneBranchType.regular) PhoneBranchType type,
  }) = _PhoneBranch;

  const PhoneBranch._();
}
