import 'package:domain/domain.dart';

import '../../exports/exports.dart';

extension AssetModelImageSourceX on AssetModel {
  ImageSource toImageSource({
    bool preferSignedUrl = true,
    String ref = 'asset',
    Metadata metadata = const Metadata(),
  }) {
    return ImageSource(id: id, uri: downloadUrl, ref: ref, metadata: metadata);
  }
}
