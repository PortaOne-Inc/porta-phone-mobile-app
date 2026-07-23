/// Reusable `FormFieldValidator<String>` functions for text inputs.
///
/// Each method matches the Flutter validator signature (returns `null` when the
/// value is valid, or an error message otherwise) so it can be passed directly
/// to a `TextFormField.validator`.
class FormValidators {
  const FormValidators._();

  /// Requires a non-empty, well-formed `https://` URL.
  ///
  /// The value must parse as a [Uri] whose scheme is `https` and whose host is
  /// non-empty. Returns [requiredMessage] when empty and [invalidMessage] when
  /// the value is not a valid https URL.
  static String? httpsUri(
    String? value, {
    String requiredMessage = 'Required',
    String invalidMessage = 'Enter a valid https:// URL',
  }) {
    final raw = value?.trim() ?? '';
    if (raw.isEmpty) return requiredMessage;
    final uri = Uri.tryParse(raw);
    if (uri == null || uri.scheme.toLowerCase() != 'https' || uri.host.isEmpty) {
      return invalidMessage;
    }
    return null;
  }
}
