import '../models/models.dart';

extension EmbeddedResourceTypeExt on EmbeddedResourceType {
  String l10n() {
    switch (this) {
      case EmbeddedResourceType.url:
        return 'Provide a URL for the embedded page (It will be loaded in an iframe)';
      case EmbeddedResourceType.html:
        return 'Provide a static HTML file for the embedded page (It will be stored in assets)';
    }
  }

  bool get isUrl => this == EmbeddedResourceType.url;

  bool get isHtml => this == EmbeddedResourceType.html;
}
