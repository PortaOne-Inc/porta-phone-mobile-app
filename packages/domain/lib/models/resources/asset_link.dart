import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_link.freezed.dart';

part 'asset_link.g.dart';

@freezed
sealed class AssetLink with _$AssetLink {
  const factory AssetLink({
    required String type, // e.g. "embed" | "post" | "user" | "asset"
    required String id,
  }) = _AssetLink;

  factory AssetLink.fromJson(Map<String, dynamic> json) =>
      _$AssetLinkFromJson(json);
}
