// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSWallpaperExtension on JSChrome {
  @JS('wallpaper')
  external JSWallpaper? get wallpaperNullable;

  /// Use the `chrome.wallpaper` API to change the ChromeOS wallpaper.
  JSWallpaper get wallpaper {
    var wallpaperNullable = this.wallpaperNullable;
    if (wallpaperNullable == null) {
      throw ApiNotAvailableException('chrome.wallpaper');
    }
    return wallpaperNullable;
  }
}

extension type JSWallpaper._(JSObject _) {
  /// Sets wallpaper to the image at _url_ or _wallpaperData_ with the specified
  /// _layout_
  external JSPromise setWallpaper(SetWallpaperDetails details);
}

/// The supported wallpaper layouts.
typedef WallpaperLayout = JSString;
extension type SetWallpaperDetails._(JSObject _) implements JSObject {
  external factory SetWallpaperDetails({
    /// The jpeg or png encoded wallpaper image as an ArrayBuffer.
    JSArrayBuffer? data,

    /// The URL of the wallpaper to be set (can be relative).
    String? url,

    /// The supported wallpaper layouts.
    WallpaperLayout layout,

    /// The file name of the saved wallpaper.
    String filename,

    /// True if a 128x60 thumbnail should be generated. Layout and ratio are not
    /// supported yet.
    bool? thumbnail,
  });

  /// The jpeg or png encoded wallpaper image as an ArrayBuffer.
  external JSArrayBuffer? data;

  /// The URL of the wallpaper to be set (can be relative).
  external String? url;

  /// The supported wallpaper layouts.
  external WallpaperLayout layout;

  /// The file name of the saved wallpaper.
  external String filename;

  /// True if a 128x60 thumbnail should be generated. Layout and ratio are not
  /// supported yet.
  external bool? thumbnail;
}
