import '../models/models.dart';

extension EmbeddedResourceTypeExt on EmbeddedResourceSource {
  String l10n() {
    switch (this) {
      case EmbeddedResourceSource.url:
        return 'Provide a URL for the embedded page (It will be loaded in an iframe)';
      case EmbeddedResourceSource.html:
        return 'Provide a static HTML file for the embedded page (It will be stored in assets)';
    }
  }

  bool get isUrl => this == EmbeddedResourceSource.url;

  bool get isHtml => this == EmbeddedResourceSource.html;
}
