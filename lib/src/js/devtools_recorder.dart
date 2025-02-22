// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';
import 'devtools.dart';

export 'chrome.dart';
export 'devtools.dart';

extension JSChromeJSDevtoolsRecorderExtension on JSChromeDevtools {
  @JS('recorder')
  external JSDevtoolsRecorder? get recorderNullable;

  /// Use the `chrome.devtools.recorder` API to customize the Recorder panel in
  /// DevTools.
  JSDevtoolsRecorder get recorder {
    var recorderNullable = this.recorderNullable;
    if (recorderNullable == null) {
      throw ApiNotAvailableException('chrome.devtools.recorder');
    }
    return recorderNullable;
  }
}

extension type JSDevtoolsRecorder._(JSObject _) {
  /// Registers a Recorder extension plugin.
  external void registerRecorderExtensionPlugin(
    /// An instance implementing the RecorderExtensionPlugin interface.
    RecorderExtensionPlugin plugin,

    /// The name of the plugin.
    String name,

    /// The media type of the string content that the plugin produces.
    String mediaType,
  );

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  external RecorderView createView(
    /// Title that is displayed next to the extension icon in the Developer
    /// Tools toolbar.
    String title,

    /// Path of the panel's HTML page relative to the extension directory.
    String pagePath,
  );
}
extension type RecorderExtensionPlugin._(JSObject _) implements JSObject {
  external factory RecorderExtensionPlugin();

  /// Converts a recording from the Recorder panel format into a string.
  external void stringify(

      /// A recording of the user interaction with the page. This should match <a
      /// href="https://github.com/puppeteer/replay/blob/main/docs/api/interfaces/Schema.UserFlow.md">Puppeteer's
      /// recording schema</a>.
      JSAny recording);

  /// Converts a step of the recording from the Recorder panel format into a
  /// string.
  external void stringifyStep(

      /// A step of the recording of a user interaction with the page. This should
      /// match <a
      /// href="https://github.com/puppeteer/replay/blob/main/docs/api/modules/Schema.md#step">Puppeteer's
      /// step schema</a>.
      JSAny step);

  /// Allows the extension to implement custom replay functionality.
  external void replay(

      /// A recording of the user interaction with the page. This should match <a
      /// href="https://github.com/puppeteer/replay/blob/main/docs/api/interfaces/Schema.UserFlow.md">Puppeteer's
      /// recording schema</a>.
      JSAny recording);
}
extension type RecorderView._(JSObject _) implements JSObject {
  external factory RecorderView();

  /// Indicates that the extension wants to show this view in the Recorder
  /// panel.
  external void show();

  /// Fired when the view is shown.
  external Event get onShown;

  /// Fired when the view is hidden.
  external Event get onHidden;
}
