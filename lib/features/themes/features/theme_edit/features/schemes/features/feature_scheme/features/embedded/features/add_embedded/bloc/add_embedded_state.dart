part of 'add_embedded_cubit.dart';

@freezed
class AddEmbeddedState with _$AddEmbeddedState {
  factory AddEmbeddedState({
    required int id,
    @Default(ToolbarConfig()) ToolbarConfig toolbarConfig,
    @Default({}) Map<String, dynamic> attributes,
    @Default(EmbeddedResourceType.unknown) EmbeddedResourceType resourceType,
    @Default(EmbeddedResourceSource.html) EmbeddedResourceSource resourceSource,
    ThemeAssetModel? asset,
    @Default('') String url,
    EmbeddedResource? embeddedResource,
  }) = _Initial;

  AddEmbeddedState._();

  String get pathToAssetHtml => 'assets/html/${asset?.id}.html';
}
