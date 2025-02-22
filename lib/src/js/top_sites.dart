// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSTopSitesExtension on JSChrome {
  @JS('topSites')
  external JSTopSites? get topSitesNullable;

  /// Use the `chrome.topSites` API to access the top sites (i.e. most visited
  /// sites) that are displayed on the new tab page. These do not include
  /// shortcuts customized by the user.
  JSTopSites get topSites {
    var topSitesNullable = this.topSitesNullable;
    if (topSitesNullable == null) {
      throw ApiNotAvailableException('chrome.topSites');
    }
    return topSitesNullable;
  }
}

extension type JSTopSites._(JSObject _) {
  /// Gets a list of top sites.
  external JSPromise get();
}
extension type MostVisitedURL._(JSObject _) implements JSObject {
  external factory MostVisitedURL({
    /// The most visited URL.
    String url,

    /// The title of the page
    String title,
  });

  /// The most visited URL.
  external String url;

  /// The title of the page
  external String title;
}
