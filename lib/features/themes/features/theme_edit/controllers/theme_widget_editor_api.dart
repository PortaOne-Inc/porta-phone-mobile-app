import 'dart:async';

import 'package:collection/collection.dart';

import 'package:webtrit_configurator/exports/exports.dart';

abstract class ThemeWidgetEditorApi {
  ThemeWidgetConfig get initial;

  ThemeWidgetConfig? get initialOrNull;

  ThemeWidgetConfig get current;

  void setInitial(ThemeWidgetConfig initial);

  void resetToInitial();

  void resetTo(ThemeWidgetConfig model, {bool setAsInitial = false});

  ThemeWidgetConfig buildFull();

  void setThemeWidgetConfig(ThemeWidgetConfig cfg);

  void setFonts(FontsConfig fonts);

  void setGlobalFontFamily(String? fontFamily);

  void setButton(ButtonWidgetConfig button);

  void setPrimaryElevatedButton(ButtonStyleConfig? cfg);

  void setGroup(GroupWidgetConfig group);

  void setGroupTitleListTile(GroupTitleListTileWidgetConfig cfg);

  void setGroupTitleListTileBackground(String? color);

  void setBar(BarWidgetConfig bar);

  void setBottomNavigationBar(BottomNavigationBarWidgetConfig cfg);

  void setBottomNavBarBackground(String? color);

  void setBottomNavBarSelected(String? color);

  void setBottomNavBarUnselected(String? color);

  void setExtTabBar(AppBarConfig cfg);

  void setTabBar(TabBarConfig cfg);

  void setImageAssets(ImageAssetsConfig cfg);

  void setDefaultPlaceholderImage(ImageSource imageSource);

  void setAppIcon(AppIconWidgetConfig cfg);

  void setLeadingAvatarStyle(LeadingAvatarStyleConfig cfg);

  void setInput(InputWidgetConfig cfg);

  void setTextFormField(TextFormFieldWidgetConfig cfg);

  void setInputLabelColor(String? color);

  void setInputBorder(InputBorderWidgetConfig cfg);

  void setInputBorderDisabled(BorderWidgetConfig cfg);

  void setInputBorderFocused(BorderWidgetConfig cfg);

  void setInputBorderAny(BorderWidgetConfig cfg);

  void setText(TextWidgetConfig cfg);

  void setTextSelection(TextSelectionWidgetConfig cfg);

  void setTextCursorColor(String? color);

  void setTextSelectionColor(String? color);

  void setTextSelectionHandleColor(String? color);

  void setLinkify(LinkifyWidgetConfig cfg);

  void setLinkifyStyleColor(String? color);

  void setLinkifyLinkColor(String? color);

  void setDialog(DialogWidgetConfig cfg);

  void setConfirmDialog(ConfirmDialogWidgetConfig cfg);

  void setConfirmDialogActive1(String? color);

  void setConfirmDialogActive2(String? color);

  void setConfirmDialogDefault(String? color);

  void setSnackBar(SnackBarWidgetConfig cfg);

  void setStatuses(StatusesWidgetConfig cfg);

  void setRegistrationStatuses(RegistrationStatusesWidgetConfig cfg);

  void setRegistrationOnline(String color);

  void setRegistrationOffline(String color);

  void setCallStatuses(CallStatusesWidgetConfig cfg);

  void setCallStatusesConnectivityNone(String color);

  void setCallStatusesConnectError(String color);

  void setCallStatusesAppUnregistered(String color);

  void setCallStatusesConnectIssue(String color);

  void setCallStatusesInProgress(String color);

  void setCallStatusesReady(String color);

  void setDecoration(DecorationConfig cfg);

  void setPrimaryGradient(GradientColorsConfig cfg);

  void setPrimaryGradientColors(List<CustomColor> colors);
}

class ThemeWidgetEditor implements ThemeWidgetEditorApi {
  ThemeWidgetEditor({ThemeWidgetConfig? initial}) {
    if (initial != null) setInitial(initial);
  }

  final DeepCollectionEquality _eq = const DeepCollectionEquality();

  ThemeWidgetConfig? _initial;
  ThemeWidgetConfig? _current;

  final _controller = StreamController<ThemeWidgetConfig>.broadcast();

  Stream<ThemeWidgetConfig> get stream => _controller.stream;

  bool get isDirty {
    final i = _initial;
    final c = _current;
    if (i == null || c == null) return false;
    return !_eq.equals(i.toJson(), c.toJson());
  }

  void _emit() {
    final c = _current;
    if (c != null && !_controller.isClosed) _controller.add(c);
  }

  @override
  ThemeWidgetConfig get initial {
    final i = _initial;
    if (i == null) {
      throw StateError(
        'ThemeWidgetEditor not initialized. Call setInitial() first.',
      );
    }
    return i;
  }

  @override
  ThemeWidgetConfig? get initialOrNull => _initial;

  @override
  ThemeWidgetConfig get current {
    final c = _current;
    if (c == null) {
      throw StateError(
        'ThemeWidgetEditor not initialized. Call setInitial() first.',
      );
    }
    return c;
  }

  @override
  void setInitial(ThemeWidgetConfig initial) {
    _initial = initial;
    _current = initial;
    _emit();
  }

  @override
  void resetToInitial() {
    _current = _initial;
    _emit();
  }

  @override
  void resetTo(ThemeWidgetConfig model, {bool setAsInitial = false}) {
    _current = model;
    if (setAsInitial) _initial = model;
    _emit();
  }

  @override
  ThemeWidgetConfig buildFull() => current;

  @override
  void setThemeWidgetConfig(ThemeWidgetConfig cfg) {
    _current = cfg;
    _emit();
  }

  @override
  void setFonts(FontsConfig fonts) {
    _current = current.copyWith(fonts: fonts);
    _emit();
  }

  @override
  void setGlobalFontFamily(String? fontFamily) {
    _current = current.copyWith(
      fonts: current.fonts.copyWith(fontFamily: fontFamily),
    );
    _emit();
  }

  @override
  void setButton(ButtonWidgetConfig button) {
    _current = current.copyWith(button: button);
    _emit();
  }

  @override
  void setPrimaryElevatedButton(ButtonStyleConfig? cfg) {
    _current = current.copyWith(
      button: current.button.copyWith(primaryElevatedButton: cfg),
    );
    _emit();
  }

  @override
  void setGroup(GroupWidgetConfig group) {
    _current = current.copyWith(group: group);
    _emit();
  }

  @override
  void setGroupTitleListTile(GroupTitleListTileWidgetConfig cfg) {
    _current = current.copyWith(
      group: (current.group ?? const GroupWidgetConfig()).copyWith(
        groupTitleListTile: cfg,
      ),
    );
    _emit();
  }

  @override
  void setGroupTitleListTileBackground(String? color) {
    _current = current.copyWith(
      group: (current.group ?? const GroupWidgetConfig()).copyWith(
        groupTitleListTile:
            (current.group?.groupTitleListTile ??
                    const GroupTitleListTileWidgetConfig())
                .copyWith(backgroundColor: color),
      ),
    );
    _emit();
  }

  // @override
  // void setGroupTitleListTileTextColor(String? color) {
  //   _current = current.copyWith(
  //     group: (current.group ?? const GroupWidgetConfig()).copyWith(
  //       groupTitleListTile:
  //           (current.group?.groupTitleListTile ?? const GroupTitleListTileWidgetConfig()).copyWith(textColor: color),
  //     ),
  //   );
  //   _emit();
  // }

  @override
  void setBar(BarWidgetConfig bar) {
    _current = current.copyWith(bar: bar);
    _emit();
  }

  @override
  void setBottomNavigationBar(BottomNavigationBarWidgetConfig cfg) {
    _current = current.copyWith(
      bar: current.bar.copyWith(bottomNavigationBar: cfg),
    );
    _emit();
  }

  @override
  void setBottomNavBarBackground(String? color) {
    _current = current.copyWith(
      bar: current.bar.copyWith(
        bottomNavigationBar: current.bar.bottomNavigationBar.copyWith(
          backgroundColor: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setBottomNavBarSelected(String? color) {
    _current = current.copyWith(
      bar: current.bar.copyWith(
        bottomNavigationBar: current.bar.bottomNavigationBar.copyWith(
          selectedItemColor: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setBottomNavBarUnselected(String? color) {
    _current = current.copyWith(
      bar: current.bar.copyWith(
        bottomNavigationBar: current.bar.bottomNavigationBar.copyWith(
          unSelectedItemColor: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setExtTabBar(AppBarConfig cfg) {
    _current = current.copyWith(bar: current.bar.copyWith(appBarConfig: cfg));
    _emit();
  }

  @override
  void setImageAssets(ImageAssetsConfig cfg) {
    _current = current.copyWith(imageAssets: cfg);
    _emit();
  }

  @override
  void setDefaultPlaceholderImage(ImageSource imageSource) {
    _current = current.copyWith(
      imageAssets: current.imageAssets.copyWith(
        defaultPlaceholderImage: imageSource,
      ),
    );
    _emit();
  }

  @override
  void setAppIcon(AppIconWidgetConfig cfg) {
    _current = current.copyWith(
      imageAssets: current.imageAssets.copyWith(appIcon: cfg),
    );
    _emit();
  }

  @override
  void setLeadingAvatarStyle(LeadingAvatarStyleConfig cfg) {
    _current = current.copyWith(
      imageAssets: current.imageAssets.copyWith(leadingAvatarStyle: cfg),
    );
    _emit();
  }

  // Input
  @override
  void setInput(InputWidgetConfig cfg) {
    _current = current.copyWith(input: cfg);
    _emit();
  }

  @override
  void setTextFormField(TextFormFieldWidgetConfig cfg) {
    _current = current.copyWith(input: current.input.copyWith(primary: cfg));
    _emit();
  }

  @override
  void setInputLabelColor(String? color) {
    _current = current.copyWith(
      input: current.input.copyWith(
        primary: current.input.primary.copyWith(labelColor: color),
      ),
    );
    _emit();
  }

  @override
  void setInputBorder(InputBorderWidgetConfig cfg) {
    _current = current.copyWith(
      input: current.input.copyWith(
        primary: current.input.primary.copyWith(border: cfg),
      ),
    );
    _emit();
  }

  @override
  void setInputBorderDisabled(BorderWidgetConfig cfg) {
    _current = current.copyWith(
      input: current.input.copyWith(
        primary: current.input.primary.copyWith(
          border: current.input.primary.border.copyWith(disabled: cfg),
        ),
      ),
    );
    _emit();
  }

  @override
  void setInputBorderFocused(BorderWidgetConfig cfg) {
    _current = current.copyWith(
      input: current.input.copyWith(
        primary: current.input.primary.copyWith(
          border: current.input.primary.border.copyWith(focused: cfg),
        ),
      ),
    );
    _emit();
  }

  @override
  void setInputBorderAny(BorderWidgetConfig cfg) {
    _current = current.copyWith(
      input: current.input.copyWith(
        primary: current.input.primary.copyWith(
          border: current.input.primary.border.copyWith(any: cfg),
        ),
      ),
    );
    _emit();
  }

  @override
  void setText(TextWidgetConfig cfg) {
    _current = current.copyWith(text: cfg);
    _emit();
  }

  @override
  void setTextSelection(TextSelectionWidgetConfig cfg) {
    _current = current.copyWith(text: current.text.copyWith(selection: cfg));
    _emit();
  }

  @override
  void setTextCursorColor(String? color) {
    _current = current.copyWith(
      text: current.text.copyWith(
        selection: current.text.selection.copyWith(cursorColor: color),
      ),
    );
    _emit();
  }

  @override
  void setTextSelectionColor(String? color) {
    _current = current.copyWith(
      text: current.text.copyWith(
        selection: current.text.selection.copyWith(selectionColor: color),
      ),
    );
    _emit();
  }

  @override
  void setTextSelectionHandleColor(String? color) {
    _current = current.copyWith(
      text: current.text.copyWith(
        selection: current.text.selection.copyWith(selectionHandleColor: color),
      ),
    );
    _emit();
  }

  @override
  void setLinkify(LinkifyWidgetConfig cfg) {
    _current = current.copyWith(text: current.text.copyWith(linkify: cfg));
    _emit();
  }

  @override
  void setLinkifyStyleColor(String? color) {
    _current = current.copyWith(
      text: current.text.copyWith(
        linkify: current.text.linkify.copyWith(styleColor: color),
      ),
    );
    _emit();
  }

  @override
  void setLinkifyLinkColor(String? color) {
    _current = current.copyWith(
      text: current.text.copyWith(
        linkify: current.text.linkify.copyWith(linkifyStyleColor: color),
      ),
    );
    _emit();
  }

  @override
  void setDialog(DialogWidgetConfig cfg) {
    _current = current.copyWith(dialog: cfg);
    _emit();
  }

  @override
  void setConfirmDialog(ConfirmDialogWidgetConfig cfg) {
    _current = current.copyWith(
      dialog: current.dialog.copyWith(confirmDialog: cfg),
    );
    _emit();
  }

  @override
  void setConfirmDialogActive1(String? color) {
    _current = current.copyWith(
      dialog: current.dialog.copyWith(
        confirmDialog: current.dialog.confirmDialog.copyWith(
          activeButtonColor1: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setConfirmDialogActive2(String? color) {
    _current = current.copyWith(
      dialog: current.dialog.copyWith(
        confirmDialog: current.dialog.confirmDialog.copyWith(
          activeButtonColor2: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setConfirmDialogDefault(String? color) {
    _current = current.copyWith(
      dialog: current.dialog.copyWith(
        confirmDialog: current.dialog.confirmDialog.copyWith(
          defaultButtonColor: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setSnackBar(SnackBarWidgetConfig cfg) {
    _current = current.copyWith(dialog: current.dialog.copyWith(snackBar: cfg));
    _emit();
  }

  @override
  void setStatuses(StatusesWidgetConfig cfg) {
    _current = current.copyWith(statuses: cfg);
    _emit();
  }

  @override
  void setRegistrationStatuses(RegistrationStatusesWidgetConfig cfg) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(registrationStatuses: cfg),
    );
    _emit();
  }

  @override
  void setRegistrationOnline(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        registrationStatuses: current.statuses.registrationStatuses.copyWith(
          online: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setRegistrationOffline(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        registrationStatuses: current.statuses.registrationStatuses.copyWith(
          offline: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setCallStatuses(CallStatusesWidgetConfig cfg) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(callStatuses: cfg),
    );
    _emit();
  }

  @override
  void setCallStatusesConnectivityNone(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(
          connectivityNone: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setCallStatusesConnectError(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(
          connectError: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setCallStatusesAppUnregistered(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(
          appUnregistered: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setCallStatusesConnectIssue(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(
          connectIssue: color,
        ),
      ),
    );
    _emit();
  }

  @override
  void setCallStatusesInProgress(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(inProgress: color),
      ),
    );
    _emit();
  }

  @override
  void setCallStatusesReady(String color) {
    _current = current.copyWith(
      statuses: current.statuses.copyWith(
        callStatuses: current.statuses.callStatuses.copyWith(ready: color),
      ),
    );
    _emit();
  }

  @override
  void setDecoration(DecorationConfig cfg) {
    _current = current.copyWith(decorationConfig: cfg);
    _emit();
  }

  @override
  void setPrimaryGradient(GradientColorsConfig cfg) {
    _current = current.copyWith(
      decorationConfig: current.decorationConfig.copyWith(
        primaryGradientColorsConfig: cfg,
      ),
    );
    _emit();
  }

  @override
  void setPrimaryGradientColors(List<CustomColor> colors) {
    _current = current.copyWith(
      decorationConfig: current.decorationConfig.copyWith(
        primaryGradientColorsConfig: current
            .decorationConfig
            .primaryGradientColorsConfig
            .copyWith(colors: List<CustomColor>.from(colors)),
      ),
    );
    _emit();
  }

  Future<void> dispose() async {
    await _controller.close();
  }

  @override
  void setTabBar(TabBarConfig cfg) {
    _current = current.copyWith(bar: current.bar.copyWith(tabBarConfig: cfg));
    _emit();
  }
}
