// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSFontSettingsExtension on JSChrome {
  @JS('fontSettings')
  external JSFontSettings? get fontSettingsNullable;

  /// Use the `chrome.fontSettings` API to manage Chrome's font settings.
  JSFontSettings get fontSettings {
    var fontSettingsNullable = this.fontSettingsNullable;
    if (fontSettingsNullable == null) {
      throw ApiNotAvailableException('chrome.fontSettings');
    }
    return fontSettingsNullable;
  }
}

extension type JSFontSettings._(JSObject _) {
  /// Clears the font set by this extension, if any.
  external JSPromise clearFont(ClearFontDetails details);

  /// Gets the font for a given script and generic font family.
  external JSPromise getFont(GetFontDetails details);

  /// Sets the font for a given script and generic font family.
  external JSPromise setFont(SetFontDetails details);

  /// Gets a list of fonts on the system.
  external JSPromise getFontList();

  /// Clears the default font size set by this extension, if any.
  external JSPromise clearDefaultFontSize(

      /// This parameter is currently unused.
      ClearDefaultFontSizeDetails? details);

  /// Gets the default font size.
  external JSPromise getDefaultFontSize(

      /// This parameter is currently unused.
      GetDefaultFontSizeDetails? details);

  /// Sets the default font size.
  external JSPromise setDefaultFontSize(SetDefaultFontSizeDetails details);

  /// Clears the default fixed font size set by this extension, if any.
  external JSPromise clearDefaultFixedFontSize(

      /// This parameter is currently unused.
      ClearDefaultFixedFontSizeDetails? details);

  /// Gets the default size for fixed width fonts.
  external JSPromise getDefaultFixedFontSize(

      /// This parameter is currently unused.
      GetDefaultFixedFontSizeDetails? details);

  /// Sets the default size for fixed width fonts.
  external JSPromise setDefaultFixedFontSize(
      SetDefaultFixedFontSizeDetails details);

  /// Clears the minimum font size set by this extension, if any.
  external JSPromise clearMinimumFontSize(

      /// This parameter is currently unused.
      ClearMinimumFontSizeDetails? details);

  /// Gets the minimum font size.
  external JSPromise getMinimumFontSize(

      /// This parameter is currently unused.
      GetMinimumFontSizeDetails? details);

  /// Sets the minimum font size.
  external JSPromise setMinimumFontSize(SetMinimumFontSizeDetails details);

  /// Fired when a font setting changes.
  external Event get onFontChanged;

  /// Fired when the default font size setting changes.
  external Event get onDefaultFontSizeChanged;

  /// Fired when the default fixed font size setting changes.
  external Event get onDefaultFixedFontSizeChanged;

  /// Fired when the minimum font size setting changes.
  external Event get onMinimumFontSizeChanged;
}

/// An ISO 15924 script code. The default, or global, script is represented by
/// script code "Zyyy".
typedef ScriptCode = JSString;

/// A CSS generic font family.
typedef GenericFamily = JSString;

/// One of
/// [not_controllable]: cannot be controlled by any extension
/// [controlled_by_other_extensions]: controlled by extensions with higher
/// precedence
/// [controllable_by_this_extension]: can be controlled by this extension
/// [controlled_by_this_extension]: controlled by this extension
typedef LevelOfControl = JSString;
extension type FontName._(JSObject _) implements JSObject {
  external factory FontName({
    /// The font ID.
    String fontId,

    /// The display name of the font.
    String displayName,
  });

  /// The font ID.
  external String fontId;

  /// The display name of the font.
  external String displayName;
}
extension type OnFontChangedDetails._(JSObject _) implements JSObject {
  external factory OnFontChangedDetails({
    /// The font ID. See the description in `getFont`.
    String fontId,

    /// The script code for which the font setting has changed.
    ScriptCode? script,

    /// The generic font family for which the font setting has changed.
    GenericFamily genericFamily,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font ID. See the description in `getFont`.
  external String fontId;

  /// The script code for which the font setting has changed.
  external ScriptCode? script;

  /// The generic font family for which the font setting has changed.
  external GenericFamily genericFamily;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type OnDefaultFontSizeChangedDetails._(JSObject _)
    implements JSObject {
  external factory OnDefaultFontSizeChangedDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type OnDefaultFixedFontSizeChangedDetails._(JSObject _)
    implements JSObject {
  external factory OnDefaultFixedFontSizeChangedDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type OnMinimumFontSizeChangedDetails._(JSObject _)
    implements JSObject {
  external factory OnMinimumFontSizeChangedDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type ClearFontDetails._(JSObject _) implements JSObject {
  external factory ClearFontDetails({
    /// The script for which the font should be cleared. If omitted, the global
    /// script font setting is cleared.
    ScriptCode? script,

    /// The generic font family for which the font should be cleared.
    GenericFamily genericFamily,
  });

  /// The script for which the font should be cleared. If omitted, the global
  /// script font setting is cleared.
  external ScriptCode? script;

  /// The generic font family for which the font should be cleared.
  external GenericFamily genericFamily;
}
extension type GetFontCallbackDetails._(JSObject _) implements JSObject {
  external factory GetFontCallbackDetails({
    /// The font ID. Rather than the literal font ID preference value, this may be
    /// the ID of the font that the system resolves the preference value to. So,
    /// [fontId] can differ from the font passed to `setFont`, if, for example,
    /// the font is not available on the system. The empty string signifies
    /// fallback to the global script font setting.
    String fontId,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font ID. Rather than the literal font ID preference value, this may be
  /// the ID of the font that the system resolves the preference value to. So,
  /// [fontId] can differ from the font passed to `setFont`, if, for example,
  /// the font is not available on the system. The empty string signifies
  /// fallback to the global script font setting.
  external String fontId;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type GetFontDetails._(JSObject _) implements JSObject {
  external factory GetFontDetails({
    /// The script for which the font should be retrieved. If omitted, the font
    /// setting for the global script (script code "Zyyy") is retrieved.
    ScriptCode? script,

    /// The generic font family for which the font should be retrieved.
    GenericFamily genericFamily,
  });

  /// The script for which the font should be retrieved. If omitted, the font
  /// setting for the global script (script code "Zyyy") is retrieved.
  external ScriptCode? script;

  /// The generic font family for which the font should be retrieved.
  external GenericFamily genericFamily;
}
extension type SetFontDetails._(JSObject _) implements JSObject {
  external factory SetFontDetails({
    /// The script code which the font should be set. If omitted, the font setting
    /// for the global script (script code "Zyyy") is set.
    ScriptCode? script,

    /// The generic font family for which the font should be set.
    GenericFamily genericFamily,

    /// The font ID. The empty string means to fallback to the global script font
    /// setting.
    String fontId,
  });

  /// The script code which the font should be set. If omitted, the font setting
  /// for the global script (script code "Zyyy") is set.
  external ScriptCode? script;

  /// The generic font family for which the font should be set.
  external GenericFamily genericFamily;

  /// The font ID. The empty string means to fallback to the global script font
  /// setting.
  external String fontId;
}
extension type ClearDefaultFontSizeDetails._(JSObject _) implements JSObject {
  external factory ClearDefaultFontSizeDetails();
}
extension type GetDefaultFontSizeCallbackDetails._(JSObject _)
    implements JSObject {
  external factory GetDefaultFontSizeCallbackDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type GetDefaultFontSizeDetails._(JSObject _) implements JSObject {
  external factory GetDefaultFontSizeDetails();
}
extension type SetDefaultFontSizeDetails._(JSObject _) implements JSObject {
  external factory SetDefaultFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});

  /// The font size in pixels.
  external int pixelSize;
}
extension type ClearDefaultFixedFontSizeDetails._(JSObject _)
    implements JSObject {
  external factory ClearDefaultFixedFontSizeDetails();
}
extension type GetDefaultFixedFontSizeCallbackDetails._(JSObject _)
    implements JSObject {
  external factory GetDefaultFixedFontSizeCallbackDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type GetDefaultFixedFontSizeDetails._(JSObject _)
    implements JSObject {
  external factory GetDefaultFixedFontSizeDetails();
}
extension type SetDefaultFixedFontSizeDetails._(JSObject _)
    implements JSObject {
  external factory SetDefaultFixedFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});

  /// The font size in pixels.
  external int pixelSize;
}
extension type ClearMinimumFontSizeDetails._(JSObject _) implements JSObject {
  external factory ClearMinimumFontSizeDetails();
}
extension type GetMinimumFontSizeCallbackDetails._(JSObject _)
    implements JSObject {
  external factory GetMinimumFontSizeCallbackDetails({
    /// The font size in pixels.
    int pixelSize,

    /// The level of control this extension has over the setting.
    LevelOfControl levelOfControl,
  });

  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}
extension type GetMinimumFontSizeDetails._(JSObject _) implements JSObject {
  external factory GetMinimumFontSizeDetails();
}
extension type SetMinimumFontSizeDetails._(JSObject _) implements JSObject {
  external factory SetMinimumFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});

  /// The font size in pixels.
  external int pixelSize;
}
