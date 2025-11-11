// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneBranchDto _$PhoneBranchDtoFromJson(Map<String, dynamic> json) =>
    PhoneBranchDto(
      json['name'] as String,
      json['commit'] == null
          ? null
          : PhoneBranchDtoCommit.fromJson(
              json['commit'] as Map<String, dynamic>,
            ),
      json['protected'] as bool?,
    );

Map<String, dynamic> _$PhoneBranchDtoToJson(PhoneBranchDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'commit': instance.commit,
      'protected': instance.protected,
    };

PhoneBranchDtoCommit _$PhoneBranchDtoCommitFromJson(
  Map<String, dynamic> json,
) => PhoneBranchDtoCommit(json['sha'] as String?, json['url'] as String?);

Map<String, dynamic> _$PhoneBranchDtoCommitToJson(
  PhoneBranchDtoCommit instance,
) => <String, dynamic>{'sha': instance.sha, 'url': instance.url};
