import 'package:bloc/bloc.dart';
import 'package:data/dto/theme/theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/feature_scheme/features/embedded/extensions/extensions.dart';

import '../models/models.dart';

part 'add_embedded_state.dart';

part 'add_embedded_cubit.freezed.dart';

class AddEmbeddedCubit extends Cubit<AddEmbeddedState> {
  AddEmbeddedCubit()
      : super(AddEmbeddedState(
          id: DateTime.now().millisecondsSinceEpoch,
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

  Future<void> saveEmbeddedData() async {
    if (state.resourceSource.isUrl) {
      emit(state.copyWith(embeddedResource: _getEmbeddedFromUrl(state.url, 'render')));
    }
    if (state.resourceSource.isHtml) {
      emit(state.copyWith(embeddedResource: _getEmbeddedFromUrl(state.asset!.url!, 'download')));
    }
  }

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
    return Metadata(attributes: state.attributes);
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
