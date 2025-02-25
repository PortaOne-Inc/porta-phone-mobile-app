import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:data/dto/theme/theme.dart';
import 'package:domain/domain.dart';

import '../../../extensions/extensions.dart';
import '../../../models/models.dart';

part 'add_embedded_state.dart';

part 'add_embedded_cubit.freezed.dart';

class AddEmbeddedCubit extends Cubit<AddEmbeddedState> {
  AddEmbeddedCubit({
    List<ThemeAssetModel>? assets,
    EmbeddedResource? embedded,
  }) : super(AddEmbeddedState(
          id: embedded?.id ?? DateTime.now().millisecondsSinceEpoch,
          toolbarConfig: embedded?.toolbar ?? const ToolbarConfig(),
          attributes: embedded?.attributes != null ? Map<String, String>.from(embedded!.attributes) : {},
          resourceType: embedded?.type ?? EmbeddedResourceType.unknown,
          asset: assets?.firstWhereOrNull((asset) =>
              asset.id ==
              int.tryParse(embedded?.metadata.attributes[EmbeddedResource.metadataAssetId]?.toString() ?? '')),
          url: embedded?.uri ?? '',
        ));

  void setToolbarVisibility(bool value) {
    emit(state.copyWith(toolbarConfig: state.toolbarConfig.copyWith(showToolbar: value)));
  }

  void setToolbarTitle(String l10nTitle) {
    emit(state.copyWith(toolbarConfig: state.toolbarConfig.copyWith(titleL10n: l10nTitle)));
  }

  void setConfigurationAsset(ThemeAssetModel? asset) {
    emit(state.copyWith(asset: asset));
  }

  void setConfigurationAttributes(Map<String, String> attributes) {
    emit(state.copyWith(attributes: attributes));
  }

  void setConfigurationUrl(String url) {
    emit(state.copyWith(url: url));
  }

  void setConfigurationResourceSource(EmbeddedResourceSource? type) {
    emit(state.copyWith(resourceSource: type ?? state.resourceSource));
  }

  void setConfigurationResourceType(EmbeddedResourceType? type) {
    emit(state.copyWith(resourceType: type ?? state.resourceType));
  }

  /// Saves the embedded data based on the resource source type.
  /// If the resource source is a URL, it sets the embedded resource to be rendered in a webview.
  /// If the resource source is HTML, it sets the embedded resource to be downloaded and used from local storage.
  Future<void> saveEmbeddedData() async {
    if (state.resourceSource.isUrl) {
      emit(state.copyWith(embeddedResource: _getEmbeddedFromUrl(state.url, 'render')));
    }
    if (state.resourceSource.isHtml) {
      emit(state.copyWith(embeddedResource: _getEmbeddedFromUrl(state.asset!.url!, 'download')));
    }
  }

  // TODO(Serdun): Replace type to source
  /// Generates an EmbeddedResource object from a URL and a URL type.
  /// The URL type parameter helps determine the action to be taken with the URL (e.g., render or download).
  EmbeddedResource _getEmbeddedFromUrl(String url, String urlType) {
    final metadata = _buildMetadata();
    final updatedUri = _updateUriWithParams(url, {'type': urlType});

    return EmbeddedResource(
      id: state.id,
      toolbar: state.toolbarConfig,
      type: state.resourceType,
      uri: updatedUri.toString(),
      metadata: metadata,
    );
  }

  Metadata _buildMetadata() {
    return Metadata(attributes: {
      ...state.attributes,
      EmbeddedResource.metadataAssetId: '${state.asset?.id}',
      EmbeddedResource.metadataAssetSource: state.resourceSource.name,
    });
  }

  Uri _updateUriWithParams(String? url, Map<String, String> params) {
    if (url == null || url.isEmpty) {
      // Return an empty URI with just the query parameters
      return Uri(queryParameters: params);
    }

    final parsedUri = Uri.tryParse(url);
    if (parsedUri == null) {
      // If the URL is invalid, return a URI with the query parameters
      return Uri(queryParameters: params);
    }

    // Merge existing query parameters with the new ones
    final updatedUri = parsedUri.replace(
      queryParameters: {
        ...parsedUri.queryParameters,
        ...params,
      },
    );

    return updatedUri;
  }
}
