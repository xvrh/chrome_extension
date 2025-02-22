// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';
import 'tabs.dart';

export 'chrome.dart';

extension JSChromeJSDesktopCaptureExtension on JSChrome {
  @JS('desktopCapture')
  external JSDesktopCapture? get desktopCaptureNullable;

  /// Desktop Capture API that can be used to capture content of screen,
  /// individual windows or tabs.
  JSDesktopCapture get desktopCapture {
    var desktopCaptureNullable = this.desktopCaptureNullable;
    if (desktopCaptureNullable == null) {
      throw ApiNotAvailableException('chrome.desktopCapture');
    }
    return desktopCaptureNullable;
  }
}

extension type JSDesktopCapture._(JSObject _) {
  /// Shows desktop media picker UI with the specified set of sources.
  external int chooseDesktopMedia(
    /// Set of sources that should be shown to the user. The sources order in
    /// the set decides the tab order in the picker.
    JSArray sources,

    /// Optional tab for which the stream is created. If not specified then the
    /// resulting stream can be used only by the calling extension. The stream
    /// can only be used by frames in the given tab whose security origin
    /// matches `tab.url`. The tab's origin must be a secure origin, e.g. HTTPS.
    Tab? targetTab,

    /// Mirrors members of
    /// [DisplayMediaStreamConstraints](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints)
    /// which need to be applied before the user makes their selection, and must
    /// therefore be provided to chooseDesktopMedia() rather than be deferred to
    /// getUserMedia().
    ChooseDesktopMediaOptions? options,
    JSFunction callback,
  );

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  external void cancelChooseDesktopMedia(

      /// Id returned by chooseDesktopMedia()
      int desktopMediaRequestId);
}

/// Enum used to define set of desktop media sources used in
/// chooseDesktopMedia().
typedef DesktopCaptureSourceType = JSString;

/// Mirrors
/// [SystemAudioPreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum).
typedef SystemAudioPreferenceEnum = JSString;

/// Mirrors
/// [SelfCapturePreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum).
typedef SelfCapturePreferenceEnum = JSString;
extension type ChooseDesktopMediaOptions._(JSObject _) implements JSObject {
  external factory ChooseDesktopMediaOptions({
    /// Mirrors
    /// [systemAudio](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-systemaudio).
    SystemAudioPreferenceEnum? systemAudio,

    /// Mirrors
    /// [selfBrowserSurface](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-selfbrowsersurface).
    SelfCapturePreferenceEnum? selfBrowserSurface,

    /// Indicates that the caller intends to perform local audio suppression, and
    /// that the media picker shown to the user should therefore reflect that with
    /// the appropriate warnings, as it does when getDisplayMedia() is invoked.
    bool? suppressLocalAudioPlaybackIntended,
  });

  /// Mirrors
  /// [systemAudio](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-systemaudio).
  external SystemAudioPreferenceEnum? systemAudio;

  /// Mirrors
  /// [selfBrowserSurface](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-selfbrowsersurface).
  external SelfCapturePreferenceEnum? selfBrowserSurface;

  /// Indicates that the caller intends to perform local audio suppression, and
  /// that the media picker shown to the user should therefore reflect that with
  /// the appropriate warnings, as it does when getDisplayMedia() is invoked.
  external bool? suppressLocalAudioPlaybackIntended;
}
