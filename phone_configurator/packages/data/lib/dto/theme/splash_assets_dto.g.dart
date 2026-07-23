// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_assets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplashAssetsDtoImpl _$$SplashAssetsDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SplashAssetsDtoImpl(
  originalAssetId: (json['originalAssetId'] as num?)?.toInt(),
  pictureUrl: json['pictureUrl'] as String?,
  color: json['color'] as String?,
  padding: (json['padding'] as num?)?.toDouble() ?? 0.0,
  fit: json['fit'] as String? ?? 'scaleDown',
);

Map<String, dynamic> _$$SplashAssetsDtoImplToJson(
  _$SplashAssetsDtoImpl instance,
) => <String, dynamic>{
  'originalAssetId': instance.originalAssetId,
  'pictureUrl': instance.pictureUrl,
  'color': instance.color,
  'padding': instance.padding,
  'fit': instance.fit,
};
