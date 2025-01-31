import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_assets_dto.freezed.dart';

part 'splash_assets_dto.g.dart';

@freezed
class SplashAssetsDto with _$SplashAssetsDto {
  @JsonSerializable(explicitToJson: true)
  const factory SplashAssetsDto({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
  }) = _SplashAssetsDto;

  factory SplashAssetsDto.fromJson(Map<String, dynamic> json) => _$SplashAssetsDtoFromJson(json);
}
