// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';
import 'events.dart';

export 'chrome.dart';

extension JSChromeJSDeclarativeContentExtension on JSChrome {
  @JS('declarativeContent')
  external JSDeclarativeContent? get declarativeContentNullable;

  /// Use the `chrome.declarativeContent` API to take actions depending on the
  /// content of a page, without requiring permission to read the page's
  /// content.
  JSDeclarativeContent get declarativeContent {
    var declarativeContentNullable = this.declarativeContentNullable;
    if (declarativeContentNullable == null) {
      throw ApiNotAvailableException('chrome.declarativeContent');
    }
    return declarativeContentNullable;
  }
}

extension type JSDeclarativeContent._(JSObject _) {
  external Event get onPageChanged;
}

typedef PageStateMatcherInstanceType = JSString;

typedef ShowPageActionInstanceType = JSString;

typedef ShowActionInstanceType = JSString;

typedef SetIconInstanceType = JSString;

typedef RequestContentScriptInstanceType = JSString;

/// See <a
/// href="https://developer.mozilla.org/en-US/docs/Web/API/ImageData">https://developer.mozilla.org/en-US/docs/Web/API/ImageData</a>.
typedef ImageDataType = JSObject;
extension type PageStateMatcher._(JSObject _) implements JSObject {
  external factory PageStateMatcher({
    /// Matches if the conditions of the `UrlFilter` are fulfilled for the
    /// top-level URL of the page.
    UrlFilter? pageUrl,

    /// Matches if all of the CSS selectors in the array match displayed elements
    /// in a frame with the same origin as the page's main frame. All selectors in
    /// this array must be [compound
    /// selectors](http://www.w3.org/TR/selectors4/#compound) to speed up
    /// matching. Note: Listing hundreds of CSS selectors or listing CSS selectors
    /// that match hundreds of times per page can slow down web sites.
    JSArray? css,

    /// Matches if the bookmarked state of the page is equal to the specified
    /// value. Requres the [bookmarks
    /// permission](/docs/extensions/develop/concepts/declare-permissions).
    bool? isBookmarked,
    PageStateMatcherInstanceType instanceType,
  });

  /// Matches if the conditions of the `UrlFilter` are fulfilled for the
  /// top-level URL of the page.
  external UrlFilter? pageUrl;

  /// Matches if all of the CSS selectors in the array match displayed elements
  /// in a frame with the same origin as the page's main frame. All selectors in
  /// this array must be [compound
  /// selectors](http://www.w3.org/TR/selectors4/#compound) to speed up
  /// matching. Note: Listing hundreds of CSS selectors or listing CSS selectors
  /// that match hundreds of times per page can slow down web sites.
  external JSArray? css;

  /// Matches if the bookmarked state of the page is equal to the specified
  /// value. Requres the [bookmarks
  /// permission](/docs/extensions/develop/concepts/declare-permissions).
  external bool? isBookmarked;

  external PageStateMatcherInstanceType instanceType;
}
extension type ShowPageAction._(JSObject _) implements JSObject {
  external factory ShowPageAction({ShowPageActionInstanceType instanceType});

  external ShowPageActionInstanceType instanceType;
}
extension type ShowAction._(JSObject _) implements JSObject {
  external factory ShowAction({ShowActionInstanceType instanceType});

  external ShowActionInstanceType instanceType;
}
extension type SetIcon._(JSObject _) implements JSObject {
  external factory SetIcon({
    SetIconInstanceType instanceType,

    /// Either an `ImageData` object or a dictionary {size -> ImageData}
    /// representing an icon to be set. If the icon is specified as a dictionary,
    /// the image used is chosen depending on the screen's pixel density. If the
    /// number of image pixels that fit into one screen space unit equals `scale`,
    /// then an image with size `scale * n` is selected, where <i>n</i> is the
    /// size of the icon in the UI. At least one image must be specified. Note
    /// that `details.imageData = foo` is equivalent to `details.imageData =
    /// {'16': foo}`.
    JSAny? imageData,
  });

  external SetIconInstanceType instanceType;

  /// Either an `ImageData` object or a dictionary {size -> ImageData}
  /// representing an icon to be set. If the icon is specified as a dictionary,
  /// the image used is chosen depending on the screen's pixel density. If the
  /// number of image pixels that fit into one screen space unit equals `scale`,
  /// then an image with size `scale * n` is selected, where <i>n</i> is the
  /// size of the icon in the UI. At least one image must be specified. Note
  /// that `details.imageData = foo` is equivalent to `details.imageData =
  /// {'16': foo}`.
  external JSAny? imageData;
}
extension type RequestContentScript._(JSObject _) implements JSObject {
  external factory RequestContentScript({
    /// Names of CSS files to be injected as a part of the content script.
    JSArray? css,

    /// Names of JavaScript files to be injected as a part of the content script.
    JSArray? js,

    /// Whether the content script runs in all frames of the matching page, or in
    /// only the top frame. Default is `false`.
    bool? allFrames,

    /// Whether to insert the content script on `about:blank` and `about:srcdoc`.
    /// Default is `false`.
    bool? matchAboutBlank,
    RequestContentScriptInstanceType instanceType,
  });

  /// Names of CSS files to be injected as a part of the content script.
  external JSArray? css;

  /// Names of JavaScript files to be injected as a part of the content script.
  external JSArray? js;

  /// Whether the content script runs in all frames of the matching page, or in
  /// only the top frame. Default is `false`.
  external bool? allFrames;

  /// Whether to insert the content script on `about:blank` and `about:srcdoc`.
  /// Default is `false`.
  external bool? matchAboutBlank;

  external RequestContentScriptInstanceType instanceType;
}
