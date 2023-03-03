class UtilityImage {
  static String? getMimeFromBase64(String? base64) {
    return base64 == null ? null : RegExp(r'[^:]\w+\/[\w-+\d.]+(?=;|,)').firstMatch(base64)?.group(0);
  }
}
