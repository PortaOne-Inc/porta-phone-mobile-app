/// Metadata for an adapter capability flag that can be toggled in the preview.
///
/// The [flag] mirrors the values advertised by the backend in
/// `system-info.adapter.supported` (see webtrit_phone `app/constants.dart`).
class PreviewCapability {
  const PreviewCapability(this.flag, this.label);

  final String flag;
  final String label;
}

/// Capabilities exposed in the preview capabilities editor, in display order.
///
/// Full set mirrors the backend `SupportedEnum` (17 values) in
/// webtrit_bss_adapter_python `app/bss/models.py`. Wire values are camelCase
/// except `cta_list`, the only snake_case value.
const List<PreviewCapability> kPreviewCapabilities = [
  // Login
  PreviewCapability('signup', 'Signup'),
  PreviewCapability('otpSignin', 'OTP sign-in'),
  PreviewCapability('passwordSignin', 'Password sign-in'),
  PreviewCapability('autoProvision', 'Auto provision'),
  // Calls
  PreviewCapability('callHistory', 'Call history (CDRs)'),
  PreviewCapability('recordings', 'Call recordings'),
  PreviewCapability('cta_list', 'Call-to-actions'),
  // Contacts
  PreviewCapability('extensions', 'Extensions (PBX contacts)'),
  // Messaging
  PreviewCapability('smsMessaging', 'SMS messaging'),
  PreviewCapability('internalMessaging', 'Internal messaging (chats)'),
  PreviewCapability('voicemail', 'Voicemail'),
  // Notifications
  PreviewCapability('notifications', 'System notifications'),
  PreviewCapability('notificationsPush', 'Push notifications'),
  // SIP presence
  PreviewCapability('sipPresence', 'SIP presence'),
  PreviewCapability('sipDialogs', 'SIP dialogs'),
  // Infra
  PreviewCapability('userEvents', 'User events'),
  PreviewCapability('customMethods', 'Custom methods'),
];

/// Capabilities enabled by default in the preview.
///
/// Mirrors the default `adapterSupported` list of `SystemInfoBuilder`, so the
/// preview behaves exactly as before until the user changes a capability.
const List<String> kDefaultPreviewCapabilities = [
  'extensions',
  'userEvents',
  'internalMessaging',
  'signup',
  'voicemail',
  'autoProvision',
  'customMethods',
];
