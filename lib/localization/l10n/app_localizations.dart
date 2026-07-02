import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Portaphone configurator'**
  String get app_name;

  /// No description provided for @theme_new.
  ///
  /// In en, this message translates to:
  /// **'New theme'**
  String get theme_new;

  /// No description provided for @theme_primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get theme_primary;

  /// No description provided for @theme_name.
  ///
  /// In en, this message translates to:
  /// **'Theme name'**
  String get theme_name;

  /// No description provided for @theme_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get theme_create;

  /// No description provided for @theme_update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get theme_update;

  /// No description provided for @common_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get common_help;

  /// No description provided for @common_file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get common_file;

  /// No description provided for @common_not_fount_go_home.
  ///
  /// In en, this message translates to:
  /// **'Go to homepage'**
  String get common_not_fount_go_home;

  /// No description provided for @common_not_fount_title.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get common_not_fount_title;

  /// No description provided for @common_not_fount_description.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we couldn\'t find the page you\'re looking for. It\'s possible that the page has been removed, renamed, or is temporarily unavailable. Please check the URL and try again, or contact us if you think this is a mistake.'**
  String get common_not_fount_description;

  /// No description provided for @feature_authorization_exception_invalid_credentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get feature_authorization_exception_invalid_credentials;

  /// No description provided for @feature_authorization_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset password.'**
  String get feature_authorization_reset_password;

  /// No description provided for @authorization_title.
  ///
  /// In en, this message translates to:
  /// **'Authorization'**
  String get authorization_title;

  /// No description provided for @authorization_session_expired.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired.\nPlease log in again'**
  String get authorization_session_expired;

  /// No description provided for @authorization_enter_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get authorization_enter_email_hint;

  /// No description provided for @authorization_enter_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get authorization_enter_password_hint;

  /// No description provided for @authorization_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authorization_sign_in;

  /// No description provided for @configurator_color_template_title.
  ///
  /// In en, this message translates to:
  /// **'Color scheme'**
  String get configurator_color_template_title;

  /// No description provided for @configurator_text_font.
  ///
  /// In en, this message translates to:
  /// **'Text font'**
  String get configurator_text_font;

  /// No description provided for @configurator_button_text_style.
  ///
  /// In en, this message translates to:
  /// **'Text button'**
  String get configurator_button_text_style;

  /// No description provided for @configurator_general_text_style.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get configurator_general_text_style;

  /// No description provided for @configurator_primary_text_style.
  ///
  /// In en, this message translates to:
  /// **'Primary text'**
  String get configurator_primary_text_style;

  /// No description provided for @configurator_accent_text_style.
  ///
  /// In en, this message translates to:
  /// **'Accent text'**
  String get configurator_accent_text_style;

  /// No description provided for @configurator_image_resources.
  ///
  /// In en, this message translates to:
  /// **'Image resources'**
  String get configurator_image_resources;

  /// No description provided for @configurator_common_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get configurator_common_color;

  /// No description provided for @configurator_text_line_height.
  ///
  /// In en, this message translates to:
  /// **'Line height'**
  String get configurator_text_line_height;

  /// No description provided for @configurator_text_later_spacing.
  ///
  /// In en, this message translates to:
  /// **'Later spacing'**
  String get configurator_text_later_spacing;

  /// No description provided for @configurator_text_word_spacing.
  ///
  /// In en, this message translates to:
  /// **'Word spacing'**
  String get configurator_text_word_spacing;

  /// No description provided for @configurator_text_dispay_large.
  ///
  /// In en, this message translates to:
  /// **'Display large'**
  String get configurator_text_dispay_large;

  /// No description provided for @configurator_font_add.
  ///
  /// In en, this message translates to:
  /// **'Add font style'**
  String get configurator_font_add;

  /// No description provided for @configurator_image_resource_onboarding.
  ///
  /// In en, this message translates to:
  /// **'Onboarding image'**
  String get configurator_image_resource_onboarding;

  /// No description provided for @configurator_color_primary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get configurator_color_primary;

  /// No description provided for @configurator_color_on_primary.
  ///
  /// In en, this message translates to:
  /// **'On Primary'**
  String get configurator_color_on_primary;

  /// No description provided for @configurator_color_secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get configurator_color_secondary;

  /// No description provided for @configurator_color_secondary_container.
  ///
  /// In en, this message translates to:
  /// **'Secondary Container'**
  String get configurator_color_secondary_container;

  /// No description provided for @configurator_color_on_secondary_container.
  ///
  /// In en, this message translates to:
  /// **'On Secondary Container'**
  String get configurator_color_on_secondary_container;

  /// No description provided for @configurator_color_tertiary.
  ///
  /// In en, this message translates to:
  /// **'Tertiary'**
  String get configurator_color_tertiary;

  /// No description provided for @configurator_color_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get configurator_color_error;

  /// No description provided for @configurator_color_outline.
  ///
  /// In en, this message translates to:
  /// **'Outline'**
  String get configurator_color_outline;

  /// No description provided for @configurator_color_background.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get configurator_color_background;

  /// No description provided for @configurator_color_surface.
  ///
  /// In en, this message translates to:
  /// **'Surface'**
  String get configurator_color_surface;

  /// No description provided for @configurator_color_on_surface.
  ///
  /// In en, this message translates to:
  /// **'On Surface'**
  String get configurator_color_on_surface;

  /// No description provided for @configurator_color_gradient_tab.
  ///
  /// In en, this message translates to:
  /// **'Gradient Tab'**
  String get configurator_color_gradient_tab;

  /// No description provided for @configurator_color_gradient_control_panel.
  ///
  /// In en, this message translates to:
  /// **'Control panel gradient'**
  String get configurator_color_gradient_control_panel;

  /// No description provided for @configurator_color_primary_container.
  ///
  /// In en, this message translates to:
  /// **'Primary Container'**
  String get configurator_color_primary_container;

  /// No description provided for @configurator_color_on_primary_container.
  ///
  /// In en, this message translates to:
  /// **'On Primary Container'**
  String get configurator_color_on_primary_container;

  /// No description provided for @configurator_color_on_secondary.
  ///
  /// In en, this message translates to:
  /// **'On Secondary'**
  String get configurator_color_on_secondary;

  /// No description provided for @configurator_color_on_tertiary.
  ///
  /// In en, this message translates to:
  /// **'On Tertiary'**
  String get configurator_color_on_tertiary;

  /// No description provided for @configurator_color_tertiary_container.
  ///
  /// In en, this message translates to:
  /// **'Tertiary Container'**
  String get configurator_color_tertiary_container;

  /// No description provided for @configurator_color_on_tertiary_container.
  ///
  /// In en, this message translates to:
  /// **'On Tertiary Container'**
  String get configurator_color_on_tertiary_container;

  /// No description provided for @configurator_color_on_error.
  ///
  /// In en, this message translates to:
  /// **'On Error'**
  String get configurator_color_on_error;

  /// No description provided for @configurator_color_error_container.
  ///
  /// In en, this message translates to:
  /// **'Error container'**
  String get configurator_color_error_container;

  /// No description provided for @configurator_color_on_error_container.
  ///
  /// In en, this message translates to:
  /// **'On Error Error'**
  String get configurator_color_on_error_container;

  /// No description provided for @configurator_color_outline_variant.
  ///
  /// In en, this message translates to:
  /// **'Outline Variant'**
  String get configurator_color_outline_variant;

  /// No description provided for @feature_theme_edit_Color_on_background.
  ///
  /// In en, this message translates to:
  /// **'On background'**
  String get feature_theme_edit_Color_on_background;

  /// No description provided for @configurator_color_surface_dim.
  ///
  /// In en, this message translates to:
  /// **'Surface Dim'**
  String get configurator_color_surface_dim;

  /// No description provided for @configurator_color_surface_bright.
  ///
  /// In en, this message translates to:
  /// **'Surface Bright'**
  String get configurator_color_surface_bright;

  /// No description provided for @configurator_color_surface_container_lowest.
  ///
  /// In en, this message translates to:
  /// **'Surface Container Lowest'**
  String get configurator_color_surface_container_lowest;

  /// No description provided for @configurator_color_surface_container_low.
  ///
  /// In en, this message translates to:
  /// **'Surface Container Low'**
  String get configurator_color_surface_container_low;

  /// No description provided for @configurator_color_surface_container.
  ///
  /// In en, this message translates to:
  /// **'Surface Container'**
  String get configurator_color_surface_container;

  /// No description provided for @configurator_color_surface_container_high.
  ///
  /// In en, this message translates to:
  /// **'Surface Container High'**
  String get configurator_color_surface_container_high;

  /// No description provided for @configurator_color_surface_container_highest.
  ///
  /// In en, this message translates to:
  /// **'Surface Container Highest'**
  String get configurator_color_surface_container_highest;

  /// No description provided for @configurator_color_on_surface_variant.
  ///
  /// In en, this message translates to:
  /// **'On Surface Variant'**
  String get configurator_color_on_surface_variant;

  /// No description provided for @configurator_color_inverse_surface.
  ///
  /// In en, this message translates to:
  /// **'Inverse Surface'**
  String get configurator_color_inverse_surface;

  /// No description provided for @configurator_color_inverse_primary.
  ///
  /// In en, this message translates to:
  /// **'Inverse Primary'**
  String get configurator_color_inverse_primary;

  /// No description provided for @configurator_color_shadow.
  ///
  /// In en, this message translates to:
  /// **'Shadow'**
  String get configurator_color_shadow;

  /// No description provided for @configurator_color_scrim.
  ///
  /// In en, this message translates to:
  /// **'Scrim'**
  String get configurator_color_scrim;

  /// No description provided for @configurator_color_surface_tint.
  ///
  /// In en, this message translates to:
  /// **'Surface Tint'**
  String get configurator_color_surface_tint;

  /// No description provided for @configurator_color_launcher_scheme_title.
  ///
  /// In en, this message translates to:
  /// **'Launcher color scheme'**
  String get configurator_color_launcher_scheme_title;

  /// No description provided for @configurator_color_adaptive_icon_background.
  ///
  /// In en, this message translates to:
  /// **'Adaptive icon background'**
  String get configurator_color_adaptive_icon_background;

  /// No description provided for @configurator_color_splash_background.
  ///
  /// In en, this message translates to:
  /// **'Native splash background'**
  String get configurator_color_splash_background;

  /// No description provided for @configurator_application_manager.
  ///
  /// In en, this message translates to:
  /// **'Application manager'**
  String get configurator_application_manager;

  /// No description provided for @configurator_got_it.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get configurator_got_it;

  /// No description provided for @configurator_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get configurator_cancel;

  /// No description provided for @locale_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get locale_default;

  /// No description provided for @feature_theme_primary_color.
  ///
  /// In en, this message translates to:
  /// **'Primary color'**
  String get feature_theme_primary_color;

  /// No description provided for @feature_admin_title.
  ///
  /// In en, this message translates to:
  /// **'Static theme dashboard'**
  String get feature_admin_title;

  /// No description provided for @feature_theme_Tooltip_description_title.
  ///
  /// In en, this message translates to:
  /// **'Definition of \"Theme\"'**
  String get feature_theme_Tooltip_description_title;

  /// No description provided for @feature_theme_Tooltip_description_message.
  ///
  /// In en, this message translates to:
  /// **'Theme - is a set of colors and elements that reflects your brand or style. You can have a main theme and several alternate or additional themes for a particular event. So you can create, for example, a Christmas theme for your application and apply it for a certain period of time'**
  String get feature_theme_Tooltip_description_message;

  /// No description provided for @feature_theme_InputHint_note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get feature_theme_InputHint_note;

  /// No description provided for @feature_theme_InputHint_app_name.
  ///
  /// In en, this message translates to:
  /// **'Greeting message'**
  String get feature_theme_InputHint_app_name;

  /// No description provided for @feature_theme_greeting_message.
  ///
  /// In en, this message translates to:
  /// **'Greeting message'**
  String get feature_theme_greeting_message;

  /// No description provided for @feature_theme_contact_email.
  ///
  /// In en, this message translates to:
  /// **'Contact email'**
  String get feature_theme_contact_email;

  /// No description provided for @feature_theme_switch_system.
  ///
  /// In en, this message translates to:
  /// **'Switch system'**
  String get feature_theme_switch_system;

  /// No description provided for @feature_theme_as_default.
  ///
  /// In en, this message translates to:
  /// **'As default'**
  String get feature_theme_as_default;

  /// No description provided for @feature_theme_open_local.
  ///
  /// In en, this message translates to:
  /// **'Open local theme'**
  String get feature_theme_open_local;

  /// No description provided for @feature_theme_all_theme.
  ///
  /// In en, this message translates to:
  /// **'All themes'**
  String get feature_theme_all_theme;

  /// No description provided for @feature_theme_public_themes.
  ///
  /// In en, this message translates to:
  /// **'Public themes'**
  String get feature_theme_public_themes;

  /// No description provided for @feature_theme_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get feature_theme_create;

  /// No description provided for @feature_theme_create_title.
  ///
  /// In en, this message translates to:
  /// **'Create theme'**
  String get feature_theme_create_title;

  /// No description provided for @feature_theme_create_Text_create_or_select_theme.
  ///
  /// In en, this message translates to:
  /// **'Create or select your theme'**
  String get feature_theme_create_Text_create_or_select_theme;

  /// No description provided for @feature_theme_edit_Validation_image_format.
  ///
  /// In en, this message translates to:
  /// **'The {format} is not available for this field'**
  String feature_theme_edit_Validation_image_format(Object format);

  /// No description provided for @feature_theme_edit_open_screen.
  ///
  /// In en, this message translates to:
  /// **'Open screen where using this text'**
  String get feature_theme_edit_open_screen;

  /// No description provided for @feature_theme_edit_greeting_info.
  ///
  /// In en, this message translates to:
  /// **'It is displayed on the authorization page in large font'**
  String get feature_theme_edit_greeting_info;

  /// No description provided for @feature_theme_edit_contact_us_info.
  ///
  /// In en, this message translates to:
  /// **'An email for contacting support that will be displayed on the page in the phone application'**
  String get feature_theme_edit_contact_us_info;

  /// No description provided for @feature_theme_edit_Validation_image_size.
  ///
  /// In en, this message translates to:
  /// **'Image should have {size} px'**
  String feature_theme_edit_Validation_image_size(Object size);

  /// No description provided for @feature_theme_edit_Text_no_themes_yet_title.
  ///
  /// In en, this message translates to:
  /// **'No themes yet'**
  String get feature_theme_edit_Text_no_themes_yet_title;

  /// No description provided for @feature_theme_edit_Text_no_themes_yet_description.
  ///
  /// In en, this message translates to:
  /// **'You have not created any themes yet.'**
  String get feature_theme_edit_Text_no_themes_yet_description;

  /// No description provided for @feature_theme_edit_Validation_to_short.
  ///
  /// In en, this message translates to:
  /// **'Theme name to short'**
  String get feature_theme_edit_Validation_to_short;

  /// No description provided for @feature_theme_edit_Validation_to_long.
  ///
  /// In en, this message translates to:
  /// **'Theme name to long'**
  String get feature_theme_edit_Validation_to_long;

  /// No description provided for @feature_theme_edit_ExpansionTile_common_property.
  ///
  /// In en, this message translates to:
  /// **'Text resources'**
  String get feature_theme_edit_ExpansionTile_common_property;

  /// No description provided for @feature_theme_edit_add_font.
  ///
  /// In en, this message translates to:
  /// **'Choose one of the google fonts'**
  String get feature_theme_edit_add_font;

  /// No description provided for @feature_theme_edit_edit_font.
  ///
  /// In en, this message translates to:
  /// **'Change your chosen font'**
  String get feature_theme_edit_edit_font;

  /// No description provided for @feature_theme_edit_FontPicker_font_details.
  ///
  /// In en, this message translates to:
  /// **'Font details'**
  String get feature_theme_edit_FontPicker_font_details;

  /// No description provided for @feature_theme_edit_Toolbar_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get feature_theme_edit_Toolbar_dashboard;

  /// No description provided for @feature_theme_edit_LogEvent_title.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get feature_theme_edit_LogEvent_title;

  /// No description provided for @feature_theme_edit_Image_primary_onboarding_logo.
  ///
  /// In en, this message translates to:
  /// **'Primary onboarding Logo'**
  String get feature_theme_edit_Image_primary_onboarding_logo;

  /// No description provided for @feature_theme_edit_Image_secondary_onboarding_logo.
  ///
  /// In en, this message translates to:
  /// **'Secondary onboarding Logo'**
  String get feature_theme_edit_Image_secondary_onboarding_logo;

  /// No description provided for @feature_theme_edit_TextStyle_title.
  ///
  /// In en, this message translates to:
  /// **'Text style'**
  String get feature_theme_edit_TextStyle_title;

  /// No description provided for @feature_theme_edit_TextStyle_display_large.
  ///
  /// In en, this message translates to:
  /// **'Display large'**
  String get feature_theme_edit_TextStyle_display_large;

  /// No description provided for @feature_theme_edit_TextStyle_display_medium.
  ///
  /// In en, this message translates to:
  /// **'Display medium'**
  String get feature_theme_edit_TextStyle_display_medium;

  /// No description provided for @feature_theme_edit_TextStyle_display_small.
  ///
  /// In en, this message translates to:
  /// **'Display small'**
  String get feature_theme_edit_TextStyle_display_small;

  /// No description provided for @feature_theme_edit_TextStyle_headline_large.
  ///
  /// In en, this message translates to:
  /// **'Headline large'**
  String get feature_theme_edit_TextStyle_headline_large;

  /// No description provided for @feature_theme_edit_TextStyle_headline_medium.
  ///
  /// In en, this message translates to:
  /// **'Headline medium'**
  String get feature_theme_edit_TextStyle_headline_medium;

  /// No description provided for @feature_theme_edit_TextStyle_headline_small.
  ///
  /// In en, this message translates to:
  /// **'Headline small'**
  String get feature_theme_edit_TextStyle_headline_small;

  /// No description provided for @feature_theme_edit_TextStyle_title_large.
  ///
  /// In en, this message translates to:
  /// **'Title large'**
  String get feature_theme_edit_TextStyle_title_large;

  /// No description provided for @feature_theme_edit_TextStyle_title_medium.
  ///
  /// In en, this message translates to:
  /// **'Title medium'**
  String get feature_theme_edit_TextStyle_title_medium;

  /// No description provided for @feature_theme_edit_TextStyle_title_small.
  ///
  /// In en, this message translates to:
  /// **'Title small'**
  String get feature_theme_edit_TextStyle_title_small;

  /// No description provided for @feature_theme_edit_TextStyle_body_large.
  ///
  /// In en, this message translates to:
  /// **'Body large'**
  String get feature_theme_edit_TextStyle_body_large;

  /// No description provided for @feature_theme_edit_TextStyle_body_medium.
  ///
  /// In en, this message translates to:
  /// **'Body medium'**
  String get feature_theme_edit_TextStyle_body_medium;

  /// No description provided for @feature_theme_edit_TextStyle_body_small.
  ///
  /// In en, this message translates to:
  /// **'Body small'**
  String get feature_theme_edit_TextStyle_body_small;

  /// No description provided for @feature_theme_edit_Color_on_primary.
  ///
  /// In en, this message translates to:
  /// **'On primary'**
  String get feature_theme_edit_Color_on_primary;

  /// No description provided for @feature_theme_edit_Dropdown_scale_x1.
  ///
  /// In en, this message translates to:
  /// **'x1'**
  String get feature_theme_edit_Dropdown_scale_x1;

  /// No description provided for @feature_theme_edit_Dropdown_scale_x2.
  ///
  /// In en, this message translates to:
  /// **'x2'**
  String get feature_theme_edit_Dropdown_scale_x2;

  /// No description provided for @feature_theme_edit_Dropdown_scale_x3.
  ///
  /// In en, this message translates to:
  /// **'x3'**
  String get feature_theme_edit_Dropdown_scale_x3;

  /// No description provided for @feature_theme_edit_Template.
  ///
  /// In en, this message translates to:
  /// **'Template'**
  String get feature_theme_edit_Template;

  /// No description provided for @feature_theme_edit_Template_dot.
  ///
  /// In en, this message translates to:
  /// **'Template: '**
  String get feature_theme_edit_Template_dot;

  /// No description provided for @feature_theme_edit_Template_description.
  ///
  /// In en, this message translates to:
  /// **'Use one of the color schemes'**
  String get feature_theme_edit_Template_description;

  /// No description provided for @feature_theme_info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get feature_theme_info;

  /// No description provided for @feature_theme_is_not_valid.
  ///
  /// In en, this message translates to:
  /// **'Theme is not valid'**
  String get feature_theme_is_not_valid;

  /// No description provided for @common_text_ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get common_text_ok;

  /// No description provided for @common_language_en.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get common_language_en;

  /// No description provided for @common_language_ua.
  ///
  /// In en, this message translates to:
  /// **'UA'**
  String get common_language_ua;

  /// No description provided for @common_text_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_text_delete;

  /// No description provided for @common_feature_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get common_feature_create;

  /// No description provided for @common_failure_message.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get common_failure_message;

  /// No description provided for @common_text_undefine.
  ///
  /// In en, this message translates to:
  /// **'Undefine'**
  String get common_text_undefine;

  /// No description provided for @feature_application_details_Toolbar_title.
  ///
  /// In en, this message translates to:
  /// **'Application details'**
  String get feature_application_details_Toolbar_title;

  /// No description provided for @feature_application_id.
  ///
  /// In en, this message translates to:
  /// **'Application id: '**
  String get feature_application_id;

  /// No description provided for @feature_application_Toolbar_title.
  ///
  /// In en, this message translates to:
  /// **'Create application'**
  String get feature_application_Toolbar_title;

  /// No description provided for @feature_application_Toolbar_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit application'**
  String get feature_application_Toolbar_edit;

  /// No description provided for @feature_application_Toolbar_edit_file_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get feature_application_Toolbar_edit_file_edit;

  /// No description provided for @feature_application_Toolbar_edit_file_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get feature_application_Toolbar_edit_file_delete;

  /// No description provided for @feature_application_Toolbar_edit_file_new.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get feature_application_Toolbar_edit_file_new;

  /// No description provided for @feature_application_Toolbar_edit_navigate_new.
  ///
  /// In en, this message translates to:
  /// **'Go to applications'**
  String get feature_application_Toolbar_edit_navigate_new;

  /// No description provided for @feature_application_Toolbar_edit_navigate_translations.
  ///
  /// In en, this message translates to:
  /// **'Edit translations'**
  String get feature_application_Toolbar_edit_navigate_translations;

  /// No description provided for @feature_application_Input_title.
  ///
  /// In en, this message translates to:
  /// **'Application name'**
  String get feature_application_Input_title;

  /// No description provided for @feature_application_Input_hint.
  ///
  /// In en, this message translates to:
  /// **'Name of your workspace'**
  String get feature_application_Input_hint;

  /// No description provided for @feature_application_project_name.
  ///
  /// In en, this message translates to:
  /// **'Project name'**
  String get feature_application_project_name;

  /// No description provided for @feature_application_project_description.
  ///
  /// In en, this message translates to:
  /// **'Project description'**
  String get feature_application_project_description;

  /// No description provided for @feature_application_android_package_name.
  ///
  /// In en, this message translates to:
  /// **'Android package name: '**
  String get feature_application_android_package_name;

  /// No description provided for @feature_application_android_package_name_error.
  ///
  /// In en, this message translates to:
  /// **'Android package name not correct'**
  String get feature_application_android_package_name_error;

  /// No description provided for @feature_application_identifier.
  ///
  /// In en, this message translates to:
  /// **'Application identifier: '**
  String get feature_application_identifier;

  /// No description provided for @feature_application_android_identifier.
  ///
  /// In en, this message translates to:
  /// **'Android identifier: '**
  String get feature_application_android_identifier;

  /// No description provided for @feature_application_ios_identifier.
  ///
  /// In en, this message translates to:
  /// **'IOS identifier: '**
  String get feature_application_ios_identifier;

  /// No description provided for @feature_application_identifier_error.
  ///
  /// In en, this message translates to:
  /// **'Identifier not correct'**
  String get feature_application_identifier_error;

  /// No description provided for @feature_application_terms_and_conditions_error.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions URL not correct'**
  String get feature_application_terms_and_conditions_error;

  /// No description provided for @feature_auth_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get feature_auth_logout;

  /// No description provided for @feature_auth_snackBar_success_auth.
  ///
  /// In en, this message translates to:
  /// **'Successfully authorized.'**
  String get feature_auth_snackBar_success_auth;

  /// No description provided for @feature_auth_Input_invalid_email_address.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get feature_auth_Input_invalid_email_address;

  /// No description provided for @feature_auth_Input_invalid_password_not_meet_requirements.
  ///
  /// In en, this message translates to:
  /// **'The password does not meet the requirements'**
  String get feature_auth_Input_invalid_password_not_meet_requirements;

  /// No description provided for @feature_auth_Toolbar_title_phone_configurator.
  ///
  /// In en, this message translates to:
  /// **'Your visual phone configurator'**
  String get feature_auth_Toolbar_title_phone_configurator;

  /// No description provided for @feature_auth_reset_toolbar_title.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get feature_auth_reset_toolbar_title;

  /// No description provided for @feature_auth_reset_toolbar_recover_account.
  ///
  /// In en, this message translates to:
  /// **'Recover account'**
  String get feature_auth_reset_toolbar_recover_account;

  /// No description provided for @feature_auth_reset_success.
  ///
  /// In en, this message translates to:
  /// **'Email for reset password sent'**
  String get feature_auth_reset_success;

  /// No description provided for @feature_application_title.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get feature_application_title;

  /// No description provided for @feature_application_use_current_theme.
  ///
  /// In en, this message translates to:
  /// **'Use as current for application'**
  String get feature_application_use_current_theme;

  /// No description provided for @feature_application_create_Validation_description_to_short.
  ///
  /// In en, this message translates to:
  /// **'Description to short'**
  String get feature_application_create_Validation_description_to_short;

  /// No description provided for @feature_application_create_Validation_description_to_long.
  ///
  /// In en, this message translates to:
  /// **'Description to long'**
  String get feature_application_create_Validation_description_to_long;

  /// No description provided for @feature_application_create.
  ///
  /// In en, this message translates to:
  /// **'Create application'**
  String get feature_application_create;

  /// No description provided for @feature_application_create_Tooltip_name_info.
  ///
  /// In en, this message translates to:
  /// **'The name of the project that will represent the application instance.'**
  String get feature_application_create_Tooltip_name_info;

  /// No description provided for @feature_application_create_Tooltip_identifier_info.
  ///
  /// In en, this message translates to:
  /// **'ID of the application for publication in the market.\nThe ID is unique to the app and can be seen in the app store url.'**
  String get feature_application_create_Tooltip_identifier_info;

  /// No description provided for @feature_application_create_Text_no_applications_yet_title.
  ///
  /// In en, this message translates to:
  /// **'No applications yet'**
  String get feature_application_create_Text_no_applications_yet_title;

  /// No description provided for @feature_application_create_Text_no_applications_yet_description.
  ///
  /// In en, this message translates to:
  /// **'You have not created any apps yet.'**
  String get feature_application_create_Text_no_applications_yet_description;

  /// No description provided for @feature_application_create_Text_new_application_theme.
  ///
  /// In en, this message translates to:
  /// **'New application theme'**
  String get feature_application_create_Text_new_application_theme;

  /// No description provided for @feature_application_collection_ApplicationPreviewItem_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get feature_application_collection_ApplicationPreviewItem_delete;

  /// No description provided for @feature_application_collection_ApplicationPreviewItem_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get feature_application_collection_ApplicationPreviewItem_edit;

  /// No description provided for @feature_application_collection_ApplicationStatus_ready_to_deploy.
  ///
  /// In en, this message translates to:
  /// **'Application ready to deploy'**
  String get feature_application_collection_ApplicationStatus_ready_to_deploy;

  /// No description provided for @feature_application_collection_ApplicationStatus_not_resolved_issues.
  ///
  /// In en, this message translates to:
  /// **'Not resolved {count} issues'**
  String feature_application_collection_ApplicationStatus_not_resolved_issues(Object count);

  /// No description provided for @feature_application_details_PlayStoreConfigForm_track_label.
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get feature_application_details_PlayStoreConfigForm_track_label;

  /// No description provided for @feature_application_details_PlayStoreConfigForm_status_label.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get feature_application_details_PlayStoreConfigForm_status_label;

  /// No description provided for @feature_application_details_PlayStoreConfigForm_update_priority_label.
  ///
  /// In en, this message translates to:
  /// **'Update Priority'**
  String get feature_application_details_PlayStoreConfigForm_update_priority_label;

  /// No description provided for @feature_application_details_PlayStoreConfigForm_update_priority_validator.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid priority (0-5)'**
  String get feature_application_details_PlayStoreConfigForm_update_priority_validator;

  /// No description provided for @feature_application_details_PlayStoreConfigForm_user_fraction_label.
  ///
  /// In en, this message translates to:
  /// **'User Fraction'**
  String get feature_application_details_PlayStoreConfigForm_user_fraction_label;

  /// No description provided for @feature_application_details_PlayStoreConfigForm_user_fraction_validator.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid fraction (0.0-1.0)'**
  String get feature_application_details_PlayStoreConfigForm_user_fraction_validator;

  /// No description provided for @feature_application_details_BranchSelector_input_custom_branch.
  ///
  /// In en, this message translates to:
  /// **'Input custom branch'**
  String get feature_application_details_BranchSelector_input_custom_branch;

  /// No description provided for @feature_application_details_BranchSelector_choose_branch.
  ///
  /// In en, this message translates to:
  /// **'Choose branch'**
  String get feature_application_details_BranchSelector_choose_branch;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_demo_flow_title.
  ///
  /// In en, this message translates to:
  /// **'Demo flow:'**
  String get feature_application_details_ApplicationDetailsScreen_demo_flow_title;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_demo_flow_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable this option to use the demo authentication flow.'**
  String get feature_application_details_ApplicationDetailsScreen_demo_flow_subtitle;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_configuration.
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get feature_application_details_ApplicationDetailsScreen_configuration;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_project_name.
  ///
  /// In en, this message translates to:
  /// **'Project name:'**
  String get feature_application_details_ApplicationDetailsScreen_project_name;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_project_id.
  ///
  /// In en, this message translates to:
  /// **'Project id:'**
  String get feature_application_details_ApplicationDetailsScreen_project_id;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_platform_identifier.
  ///
  /// In en, this message translates to:
  /// **'Platform identifier:'**
  String get feature_application_details_ApplicationDetailsScreen_platform_identifier;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_android_platform_id.
  ///
  /// In en, this message translates to:
  /// **'Android platform ID:'**
  String get feature_application_details_ApplicationDetailsScreen_android_platform_id;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_ios_platform_id.
  ///
  /// In en, this message translates to:
  /// **'iOS platform ID:'**
  String get feature_application_details_ApplicationDetailsScreen_ios_platform_id;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_android_build_name.
  ///
  /// In en, this message translates to:
  /// **'Android build name:'**
  String get feature_application_details_ApplicationDetailsScreen_android_build_name;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_android_build_number.
  ///
  /// In en, this message translates to:
  /// **'Android build number:'**
  String get feature_application_details_ApplicationDetailsScreen_android_build_number;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_ios_build_name.
  ///
  /// In en, this message translates to:
  /// **'iOS build name:'**
  String get feature_application_details_ApplicationDetailsScreen_ios_build_name;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_ios_build_number.
  ///
  /// In en, this message translates to:
  /// **'iOS build number:'**
  String get feature_application_details_ApplicationDetailsScreen_ios_build_number;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_application_core.
  ///
  /// In en, this message translates to:
  /// **'Application core:'**
  String get feature_application_details_ApplicationDetailsScreen_application_core;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions:'**
  String get feature_application_details_ApplicationDetailsScreen_terms_and_conditions;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_version.
  ///
  /// In en, this message translates to:
  /// **'Version:'**
  String get feature_application_details_ApplicationDetailsScreen_version;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_default_theme.
  ///
  /// In en, this message translates to:
  /// **'Default theme:'**
  String get feature_application_details_ApplicationDetailsScreen_default_theme;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get feature_application_details_ApplicationDetailsScreen_open;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_not_selected_default_theme_yet.
  ///
  /// In en, this message translates to:
  /// **'Not selected default theme yet'**
  String get feature_application_details_ApplicationDetailsScreen_not_selected_default_theme_yet;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_google_services.
  ///
  /// In en, this message translates to:
  /// **'Google services:'**
  String get feature_application_details_ApplicationDetailsScreen_google_services;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_google_services_not_uploaded.
  ///
  /// In en, this message translates to:
  /// **'Google services have not been uploaded'**
  String get feature_application_details_ApplicationDetailsScreen_google_services_not_uploaded;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_deployment.
  ///
  /// In en, this message translates to:
  /// **'Deployment'**
  String get feature_application_details_ApplicationDetailsScreen_deployment;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_platforms.
  ///
  /// In en, this message translates to:
  /// **'Platforms:'**
  String get feature_application_details_ApplicationDetailsScreen_platforms;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_android_configuration.
  ///
  /// In en, this message translates to:
  /// **'Android configuration'**
  String get feature_application_details_ApplicationDetailsScreen_android_configuration;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_select_branch_for_phone.
  ///
  /// In en, this message translates to:
  /// **'Select branch for Phone:'**
  String get feature_application_details_ApplicationDetailsScreen_select_branch_for_phone;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_additional_configuration.
  ///
  /// In en, this message translates to:
  /// **'Additional configuration'**
  String get feature_application_details_ApplicationDetailsScreen_additional_configuration;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_branches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get feature_application_details_ApplicationDetailsScreen_branches;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_enter_branch_for_callkeep.
  ///
  /// In en, this message translates to:
  /// **'Enter branch for Callkeep:'**
  String get feature_application_details_ApplicationDetailsScreen_enter_branch_for_callkeep;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_enter_branch_for_common_dependency.
  ///
  /// In en, this message translates to:
  /// **'Enter branch for Common Dependency:'**
  String get feature_application_details_ApplicationDetailsScreen_enter_branch_for_common_dependency;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_enter_branch_for_phone_configurator_tool.
  ///
  /// In en, this message translates to:
  /// **'Enter branch for Phone Configurator Tool:'**
  String get feature_application_details_ApplicationDetailsScreen_enter_branch_for_phone_configurator_tool;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_enter_branch_for_keystore.
  ///
  /// In en, this message translates to:
  /// **'Enter branch for Keystore'**
  String get feature_application_details_ApplicationDetailsScreen_enter_branch_for_keystore;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_deploy.
  ///
  /// In en, this message translates to:
  /// **'Deploy'**
  String get feature_application_details_ApplicationDetailsScreen_deploy;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_deploy_success_message.
  ///
  /// In en, this message translates to:
  /// **'Deploy process successfully started'**
  String get feature_application_details_ApplicationDetailsScreen_deploy_success_message;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_builds_configuration.
  ///
  /// In en, this message translates to:
  /// **'Builds configuration'**
  String get feature_application_details_ApplicationDetailsScreen_builds_configuration;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidCoreUrl.
  ///
  /// In en, this message translates to:
  /// **'The core URL provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidCoreUrl;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidTermsConditionsUrl.
  ///
  /// In en, this message translates to:
  /// **'The terms and conditions URL provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidTermsConditionsUrl;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionName.
  ///
  /// In en, this message translates to:
  /// **'The Android version name provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionName;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionNumber.
  ///
  /// In en, this message translates to:
  /// **'The Android version number provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidAndroidVersionNumber;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidIosVersionName.
  ///
  /// In en, this message translates to:
  /// **'The iOS version name provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidIosVersionName;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidIosVersionNumber.
  ///
  /// In en, this message translates to:
  /// **'The iOS version number provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidIosVersionNumber;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidIosPlatformId.
  ///
  /// In en, this message translates to:
  /// **'The iOS platform ID provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidIosPlatformId;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidAndroidPlatformId.
  ///
  /// In en, this message translates to:
  /// **'The Android platform ID provided is invalid.'**
  String get feature_application_details_ApplicationDetailsScreen_invalidAndroidPlatformId;

  /// No description provided for @feature_application_details_ApplicationDetailsScreen_invalidLabel_deploy_error.
  ///
  /// In en, this message translates to:
  /// **'The application can’t be deployed due to existing errors:'**
  String get feature_application_details_ApplicationDetailsScreen_invalidLabel_deploy_error;

  /// No description provided for @feature_application_details_DeployConfirmDialog_confirm_deployment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deployment'**
  String get feature_application_details_DeployConfirmDialog_confirm_deployment;

  /// No description provided for @feature_application_details_DeployConfirmDialog_android_deployment.
  ///
  /// In en, this message translates to:
  /// **'Android Deployment'**
  String get feature_application_details_DeployConfirmDialog_android_deployment;

  /// No description provided for @feature_application_details_DeployConfirmDialog_ios_deployment.
  ///
  /// In en, this message translates to:
  /// **'iOS Deployment'**
  String get feature_application_details_DeployConfirmDialog_ios_deployment;

  /// No description provided for @feature_application_details_DeployConfirmDialog_track.
  ///
  /// In en, this message translates to:
  /// **'- Track'**
  String get feature_application_details_DeployConfirmDialog_track;

  /// No description provided for @feature_application_details_DeployConfirmDialog_status.
  ///
  /// In en, this message translates to:
  /// **'- Status'**
  String get feature_application_details_DeployConfirmDialog_status;

  /// No description provided for @feature_application_details_DeployConfirmDialog_update_priority.
  ///
  /// In en, this message translates to:
  /// **'- Update Priority'**
  String get feature_application_details_DeployConfirmDialog_update_priority;

  /// No description provided for @feature_application_details_DeployConfirmDialog_user_fraction.
  ///
  /// In en, this message translates to:
  /// **'- User Fraction'**
  String get feature_application_details_DeployConfirmDialog_user_fraction;

  /// No description provided for @feature_application_details_DeployConfirmDialog_flow.
  ///
  /// In en, this message translates to:
  /// **'Flow'**
  String get feature_application_details_DeployConfirmDialog_flow;

  /// No description provided for @feature_application_details_DeployConfirmDialog_phone_source_branch.
  ///
  /// In en, this message translates to:
  /// **'Phone Source Branch'**
  String get feature_application_details_DeployConfirmDialog_phone_source_branch;

  /// No description provided for @feature_application_details_DeployConfirmDialog_callkeep_source_branch.
  ///
  /// In en, this message translates to:
  /// **'Callkeep Source Branch'**
  String get feature_application_details_DeployConfirmDialog_callkeep_source_branch;

  /// No description provided for @feature_application_details_DeployConfirmDialog_common_dependency_source_branch.
  ///
  /// In en, this message translates to:
  /// **'Common Dependency Source Branch'**
  String get feature_application_details_DeployConfirmDialog_common_dependency_source_branch;

  /// No description provided for @feature_application_details_DeployConfirmDialog_phone_configurator_tool_source_branch.
  ///
  /// In en, this message translates to:
  /// **'Phone Configurator Tool Source Branch'**
  String get feature_application_details_DeployConfirmDialog_phone_configurator_tool_source_branch;

  /// No description provided for @feature_application_details_DeployConfirmDialog_keystore_source_branch.
  ///
  /// In en, this message translates to:
  /// **'Keystore Source Branch'**
  String get feature_application_details_DeployConfirmDialog_keystore_source_branch;

  /// No description provided for @feature_application_details_DeployConfirmDialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get feature_application_details_DeployConfirmDialog_cancel;

  /// No description provided for @feature_application_details_DeployConfirmDialog_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get feature_application_details_DeployConfirmDialog_accept;

  /// No description provided for @feature_translation_TranslationItem_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Enter translation'**
  String get feature_translation_TranslationItem_hint_text;

  /// No description provided for @feature_translation_TranslationItem_tooltip_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get feature_translation_TranslationItem_tooltip_save;

  /// No description provided for @feature_translation_TranslationItem_tooltip_clear_override.
  ///
  /// In en, this message translates to:
  /// **'Clear override'**
  String get feature_translation_TranslationItem_tooltip_clear_override;

  /// No description provided for @feature_translation_TranslationsPage_name.
  ///
  /// In en, this message translates to:
  /// **'Translations'**
  String get feature_translation_TranslationsPage_name;

  /// No description provided for @feature_translation_ControlBar_all.
  ///
  /// In en, this message translates to:
  /// **'all'**
  String get feature_translation_ControlBar_all;

  /// No description provided for @feature_translation_ControlBar_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get feature_translation_ControlBar_search_hint;

  /// No description provided for @feature_translation_ControlBar_search_mode_key.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get feature_translation_ControlBar_search_mode_key;

  /// No description provided for @feature_translation_ControlBar_search_mode_value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get feature_translation_ControlBar_search_mode_value;

  /// No description provided for @feature_translation_ControlBar_search_mode_both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get feature_translation_ControlBar_search_mode_both;

  /// No description provided for @feature_translation_LocaleSettings_title.
  ///
  /// In en, this message translates to:
  /// **'Language settings'**
  String get feature_translation_LocaleSettings_title;

  /// No description provided for @feature_translation_LocaleSettings_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Language settings'**
  String get feature_translation_LocaleSettings_tooltip;

  /// No description provided for @feature_translation_LocaleSettings_empty.
  ///
  /// In en, this message translates to:
  /// **'No languages available'**
  String get feature_translation_LocaleSettings_empty;

  /// No description provided for @feature_translation_LocaleSettings_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get feature_translation_LocaleSettings_close;

  /// No description provided for @feature_translation_OverrideEditDialog_edit_translation.
  ///
  /// In en, this message translates to:
  /// **'Edit translation'**
  String get feature_translation_OverrideEditDialog_edit_translation;

  /// No description provided for @feature_translation_OverrideEditDialog_value_label.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get feature_translation_OverrideEditDialog_value_label;

  /// No description provided for @feature_translation_OverrideEditDialog_value_required.
  ///
  /// In en, this message translates to:
  /// **'Value is required'**
  String get feature_translation_OverrideEditDialog_value_required;

  /// No description provided for @feature_translation_OverrideEditDialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get feature_translation_OverrideEditDialog_cancel;

  /// No description provided for @feature_translation_OverrideEditDialog_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get feature_translation_OverrideEditDialog_save;

  /// No description provided for @feature_application_themes.
  ///
  /// In en, this message translates to:
  /// **'Applications themes'**
  String get feature_application_themes;

  /// No description provided for @feature_application_no_themes.
  ///
  /// In en, this message translates to:
  /// **'No themes yet'**
  String get feature_application_no_themes;

  /// No description provided for @feature_application_Text_butWeCan.
  ///
  /// In en, this message translates to:
  /// **'but we can'**
  String get feature_application_Text_butWeCan;

  /// No description provided for @feature_application_Text_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get feature_application_Text_or;

  /// No description provided for @feature_applications_title.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get feature_applications_title;

  /// No description provided for @feature_applications_version.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String feature_applications_version(Object version);

  /// No description provided for @feature_applications_Menu_increment.
  ///
  /// In en, this message translates to:
  /// **'Inc version'**
  String get feature_applications_Menu_increment;

  /// No description provided for @common_not_implemented.
  ///
  /// In en, this message translates to:
  /// **'Not implemented'**
  String get common_not_implemented;

  /// No description provided for @common_url_is_not_valid.
  ///
  /// In en, this message translates to:
  /// **'The provided URL is invalid'**
  String get common_url_is_not_valid;

  /// No description provided for @configurator_common_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get configurator_common_description;

  /// No description provided for @locale_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get locale_en;

  /// No description provided for @themeMode_system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeMode_system;

  /// No description provided for @themeMode_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeMode_light;

  /// No description provided for @themeMode_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeMode_dark;

  /// No description provided for @alertDialogActions_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get alertDialogActions_no;

  /// No description provided for @alertDialogActions_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get alertDialogActions_yes;

  /// No description provided for @alertDialogActions_ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get alertDialogActions_ok;

  /// No description provided for @callStatus_connectivityNone.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get callStatus_connectivityNone;

  /// No description provided for @callStatus_connectError.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get callStatus_connectError;

  /// No description provided for @callStatus_appUnregistered.
  ///
  /// In en, this message translates to:
  /// **'Unregistered'**
  String get callStatus_appUnregistered;

  /// No description provided for @callStatus_connectIssue.
  ///
  /// In en, this message translates to:
  /// **'Connection issue'**
  String get callStatus_connectIssue;

  /// No description provided for @callStatus_inProgress.
  ///
  /// In en, this message translates to:
  /// **'Connection in progress'**
  String get callStatus_inProgress;

  /// No description provided for @callStatus_ready.
  ///
  /// In en, this message translates to:
  /// **'Connection established'**
  String get callStatus_ready;

  /// No description provided for @notifications_errorSnackBar_callSignalingClientNotConnect.
  ///
  /// In en, this message translates to:
  /// **'Cannot initiate the call, please check the connection status'**
  String get notifications_errorSnackBar_callSignalingClientNotConnect;

  /// No description provided for @notifications_errorSnackBar_callConnect.
  ///
  /// In en, this message translates to:
  /// **'Connecting to the core failed, trying to reconnect'**
  String get notifications_errorSnackBar_callConnect;

  /// No description provided for @notifications_errorSnackBar_callUserMedia.
  ///
  /// In en, this message translates to:
  /// **'No access to media input, please check app permissions'**
  String get notifications_errorSnackBar_callUserMedia;

  /// No description provided for @notifications_errorSnackBarAction_callUserMedia.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get notifications_errorSnackBarAction_callUserMedia;

  /// No description provided for @main_BottomNavigationBarItemLabel_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get main_BottomNavigationBarItemLabel_favorites;

  /// No description provided for @main_BottomNavigationBarItemLabel_recents.
  ///
  /// In en, this message translates to:
  /// **'Recents'**
  String get main_BottomNavigationBarItemLabel_recents;

  /// No description provided for @main_BottomNavigationBarItemLabel_contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get main_BottomNavigationBarItemLabel_contacts;

  /// No description provided for @main_BottomNavigationBarItemLabel_keypad.
  ///
  /// In en, this message translates to:
  /// **'Keypad'**
  String get main_BottomNavigationBarItemLabel_keypad;

  /// No description provided for @call_FailureAcknowledgeDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get call_FailureAcknowledgeDialog_title;

  /// No description provided for @call_description_incoming.
  ///
  /// In en, this message translates to:
  /// **'Incoming call from'**
  String get call_description_incoming;

  /// No description provided for @call_description_outgoing.
  ///
  /// In en, this message translates to:
  /// **'Outgoing call to'**
  String get call_description_outgoing;

  /// No description provided for @call_CallActionsTooltip_mute.
  ///
  /// In en, this message translates to:
  /// **'Mute microphone'**
  String get call_CallActionsTooltip_mute;

  /// No description provided for @call_CallActionsTooltip_unmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute microphone'**
  String get call_CallActionsTooltip_unmute;

  /// No description provided for @call_CallActionsTooltip_disableCamera.
  ///
  /// In en, this message translates to:
  /// **'Disable camera'**
  String get call_CallActionsTooltip_disableCamera;

  /// No description provided for @call_CallActionsTooltip_enableCamera.
  ///
  /// In en, this message translates to:
  /// **'Enable camera'**
  String get call_CallActionsTooltip_enableCamera;

  /// No description provided for @call_CallActionsTooltip_disableSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Disable speakerphone'**
  String get call_CallActionsTooltip_disableSpeaker;

  /// No description provided for @call_CallActionsTooltip_enableSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Enable speakerphone'**
  String get call_CallActionsTooltip_enableSpeaker;

  /// No description provided for @call_CallActionsTooltip_transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get call_CallActionsTooltip_transfer;

  /// No description provided for @call_CallActionsTooltip_hold.
  ///
  /// In en, this message translates to:
  /// **'Hold call'**
  String get call_CallActionsTooltip_hold;

  /// No description provided for @call_CallActionsTooltip_unhold.
  ///
  /// In en, this message translates to:
  /// **'Unhold call'**
  String get call_CallActionsTooltip_unhold;

  /// No description provided for @call_CallActionsTooltip_showKeypad.
  ///
  /// In en, this message translates to:
  /// **'Show keypad'**
  String get call_CallActionsTooltip_showKeypad;

  /// No description provided for @call_CallActionsTooltip_hideKeypad.
  ///
  /// In en, this message translates to:
  /// **'Hide keypad'**
  String get call_CallActionsTooltip_hideKeypad;

  /// No description provided for @call_CallActionsTooltip_hangup.
  ///
  /// In en, this message translates to:
  /// **'Hangup'**
  String get call_CallActionsTooltip_hangup;

  /// No description provided for @call_CallActionsTooltip_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get call_CallActionsTooltip_accept;

  /// No description provided for @favorites_BodyCenter_failure.
  ///
  /// In en, this message translates to:
  /// **'Failed to get favorites'**
  String get favorites_BodyCenter_failure;

  /// No description provided for @favorites_BodyCenter_empty.
  ///
  /// In en, this message translates to:
  /// **'There are no favorite numbers'**
  String get favorites_BodyCenter_empty;

  /// No description provided for @favorites_SnackBar_deleted.
  ///
  /// In en, this message translates to:
  /// **'{name} deleted'**
  String favorites_SnackBar_deleted(String name);

  /// No description provided for @favorites_DeleteConfirmDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm deleting'**
  String get favorites_DeleteConfirmDialog_title;

  /// No description provided for @favorites_DeleteConfirmDialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the current favorite?'**
  String get favorites_DeleteConfirmDialog_content;

  /// No description provided for @login_Button_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get login_Button_back;

  /// No description provided for @login_TextFieldLabelText_coreUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter your Core URL'**
  String get login_TextFieldLabelText_coreUrl;

  /// No description provided for @login_Button_coreUrlAssign.
  ///
  /// In en, this message translates to:
  /// **'Assign'**
  String get login_Button_coreUrlAssign;

  /// No description provided for @loginOtpRequestTabPhoneTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get loginOtpRequestTabPhoneTextFieldLabel;

  /// No description provided for @loginOtpRequestTabProceedButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get loginOtpRequestTabProceedButtonLabel;

  /// No description provided for @loginOtpRequestTabCodeTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code'**
  String get loginOtpRequestTabCodeTextFieldLabel;

  /// No description provided for @loginOtpRequestTabVerifyButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get loginOtpRequestTabVerifyButtonLabel;

  /// No description provided for @login_validationCoreUrlError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a correct URL'**
  String get login_validationCoreUrlError;

  /// No description provided for @login_LoginIncompatibleCoreVersionExceptionError.
  ///
  /// In en, this message translates to:
  /// **'Incompatible Core version provided'**
  String get login_LoginIncompatibleCoreVersionExceptionError;

  /// No description provided for @login_FormatExceptionError.
  ///
  /// In en, this message translates to:
  /// **'A response issue occurred'**
  String get login_FormatExceptionError;

  /// No description provided for @login_SocketExceptionError.
  ///
  /// In en, this message translates to:
  /// **'A network issue occurred'**
  String get login_SocketExceptionError;

  /// No description provided for @login_TypeErrorError.
  ///
  /// In en, this message translates to:
  /// **'A response issue occurred'**
  String get login_TypeErrorError;

  /// No description provided for @login_RequestFailureError.
  ///
  /// In en, this message translates to:
  /// **'A server failure occurred'**
  String get login_RequestFailureError;

  /// No description provided for @login_RequestFailureEmptyEmailError.
  ///
  /// In en, this message translates to:
  /// **'Cannot send the verification code'**
  String get login_RequestFailureEmptyEmailError;

  /// No description provided for @login_RequestFailurePhoneNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'Phone number not found'**
  String get login_RequestFailurePhoneNotFoundError;

  /// No description provided for @login_RequestFailureCodeIncorrectError.
  ///
  /// In en, this message translates to:
  /// **'Incorrect verification code'**
  String get login_RequestFailureCodeIncorrectError;

  /// No description provided for @login_RequestFailureOtpIdVerifyAttemptsExceededError.
  ///
  /// In en, this message translates to:
  /// **'Verification attempts exceeded'**
  String get login_RequestFailureOtpIdVerifyAttemptsExceededError;

  /// No description provided for @validationBlankError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value'**
  String get validationBlankError;

  /// No description provided for @validationInvalidVersionFormat.
  ///
  /// In en, this message translates to:
  /// **'Must be in format X.Y.Z (e.g. 1.0.0)'**
  String get validationInvalidVersionFormat;

  /// No description provided for @validationInvalidBuildNumber.
  ///
  /// In en, this message translates to:
  /// **'Must be a positive integer'**
  String get validationInvalidBuildNumber;

  /// No description provided for @recentTimeBeforeMidnight.
  ///
  /// In en, this message translates to:
  /// **'{time}'**
  String recentTimeBeforeMidnight(DateTime time);

  /// No description provided for @recentTimeAfterMidnight.
  ///
  /// In en, this message translates to:
  /// **'{time}'**
  String recentTimeAfterMidnight(DateTime time);

  /// No description provided for @recentsVisibilityFilter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get recentsVisibilityFilter_all;

  /// No description provided for @recentsVisibilityFilter_missed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get recentsVisibilityFilter_missed;

  /// No description provided for @recentsVisibilityFilter_incoming.
  ///
  /// In en, this message translates to:
  /// **'Incoming'**
  String get recentsVisibilityFilter_incoming;

  /// No description provided for @recentsVisibilityFilter_outgoing.
  ///
  /// In en, this message translates to:
  /// **'Outgoing'**
  String get recentsVisibilityFilter_outgoing;

  /// No description provided for @recents_errorSnackBar_loadFailure.
  ///
  /// In en, this message translates to:
  /// **'Oops... an error happened ☹️'**
  String get recents_errorSnackBar_loadFailure;

  /// No description provided for @recents_snackBar_deleted.
  ///
  /// In en, this message translates to:
  /// **'{name} deleted'**
  String recents_snackBar_deleted(String name);

  /// No description provided for @recents_DeleteConfirmDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm deleting'**
  String get recents_DeleteConfirmDialog_title;

  /// No description provided for @recents_DeleteConfirmDialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the current call log?'**
  String get recents_DeleteConfirmDialog_content;

  /// No description provided for @contactsSourceLocal.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get contactsSourceLocal;

  /// No description provided for @contactsSourceExternal.
  ///
  /// In en, this message translates to:
  /// **'Internal'**
  String get contactsSourceExternal;

  /// No description provided for @contacts_LocalTabText_permissionFailure.
  ///
  /// In en, this message translates to:
  /// **'There are no permissions to get local contacts'**
  String get contacts_LocalTabText_permissionFailure;

  /// No description provided for @contacts_LocalTabButton_openAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Grant access to your contacts'**
  String get contacts_LocalTabButton_openAppSettings;

  /// No description provided for @contacts_LocalTabText_failure.
  ///
  /// In en, this message translates to:
  /// **'Failed to get local contacts'**
  String get contacts_LocalTabText_failure;

  /// No description provided for @contacts_LocalTabText_emptyOnSearching.
  ///
  /// In en, this message translates to:
  /// **'No local contacts found'**
  String get contacts_LocalTabText_emptyOnSearching;

  /// No description provided for @contacts_LocalTabText_empty.
  ///
  /// In en, this message translates to:
  /// **'No local contacts'**
  String get contacts_LocalTabText_empty;

  /// No description provided for @contacts_LocalTabButton_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get contacts_LocalTabButton_refresh;

  /// No description provided for @contacts_ExternalTabText_failure.
  ///
  /// In en, this message translates to:
  /// **'Failed to get external contacts'**
  String get contacts_ExternalTabText_failure;

  /// No description provided for @contacts_ExternalTabText_emptyOnSearching.
  ///
  /// In en, this message translates to:
  /// **'No external contacts found'**
  String get contacts_ExternalTabText_emptyOnSearching;

  /// No description provided for @contacts_ExternalTabText_empty.
  ///
  /// In en, this message translates to:
  /// **'No local contacts'**
  String get contacts_ExternalTabText_empty;

  /// No description provided for @contacts_ExternalTabButton_refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get contacts_ExternalTabButton_refresh;

  /// No description provided for @settings_AppBarTitle_myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get settings_AppBarTitle_myAccount;

  /// No description provided for @settings_ListViewTileTitle_registered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get settings_ListViewTileTitle_registered;

  /// No description provided for @settings_ListViewTileTitle_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settings_ListViewTileTitle_logout;

  /// No description provided for @settings_ListViewTileTitle_settings.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get settings_ListViewTileTitle_settings;

  /// No description provided for @settings_ListViewTileTitle_network.
  ///
  /// In en, this message translates to:
  /// **'Network settings'**
  String get settings_ListViewTileTitle_network;

  /// No description provided for @settings_ListViewTileTitle_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settings_ListViewTileTitle_help;

  /// No description provided for @settings_ListViewTileTitle_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_ListViewTileTitle_language;

  /// No description provided for @settings_ListViewTileTitle_termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get settings_ListViewTileTitle_termsConditions;

  /// No description provided for @settings_ListViewTileTitle_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settings_ListViewTileTitle_about;

  /// No description provided for @settings_ListViewTileTitle_themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get settings_ListViewTileTitle_themeMode;

  /// No description provided for @settings_ListViewTileTitle_toolbox.
  ///
  /// In en, this message translates to:
  /// **'TOOLBOX'**
  String get settings_ListViewTileTitle_toolbox;

  /// No description provided for @settings_ListViewTileTitle_logRecordsConsole.
  ///
  /// In en, this message translates to:
  /// **'Log records console'**
  String get settings_ListViewTileTitle_logRecordsConsole;

  /// No description provided for @settings_LogoutConfirmDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm logout'**
  String get settings_LogoutConfirmDialog_title;

  /// No description provided for @settings_LogoutConfirmDialog_content.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get settings_LogoutConfirmDialog_content;

  /// No description provided for @settings_FormatExceptionError.
  ///
  /// In en, this message translates to:
  /// **'A response issue occurred'**
  String get settings_FormatExceptionError;

  /// No description provided for @settings_SocketExceptionError.
  ///
  /// In en, this message translates to:
  /// **'A network issue occurred'**
  String get settings_SocketExceptionError;

  /// No description provided for @settings_TypeErrorError.
  ///
  /// In en, this message translates to:
  /// **'A response issue occurred'**
  String get settings_TypeErrorError;

  /// No description provided for @settings_RequestFailureError.
  ///
  /// In en, this message translates to:
  /// **'A server failure occurred'**
  String get settings_RequestFailureError;

  /// No description provided for @webRegistration_ErrorAcknowledgeDialog_title.
  ///
  /// In en, this message translates to:
  /// **'Web resource error'**
  String get webRegistration_ErrorAcknowledgeDialog_title;

  /// No description provided for @webRegistration_ErrorAcknowledgeDialogActions_demo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get webRegistration_ErrorAcknowledgeDialogActions_demo;

  /// No description provided for @webRegistration_ErrorAcknowledgeDialogActions_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get webRegistration_ErrorAcknowledgeDialogActions_skip;

  /// No description provided for @webRegistration_ErrorAcknowledgeDialogActions_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get webRegistration_ErrorAcknowledgeDialogActions_retry;

  /// No description provided for @underDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This page is under development.'**
  String get underDevelopment;

  /// No description provided for @notImplemented.
  ///
  /// In en, this message translates to:
  /// **'Sorry, not implemented yet'**
  String get notImplemented;

  /// No description provided for @loginModeSelectionTabDemoButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get loginModeSelectionTabDemoButtonLabel;

  /// No description provided for @loginModeSelectionTabSignInButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginModeSelectionTabSignInButtonLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
