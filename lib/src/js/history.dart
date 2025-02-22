// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSHistoryExtension on JSChrome {
  @JS('history')
  external JSHistory? get historyNullable;

  /// Use the `chrome.history` API to interact with the browser's record of
  /// visited pages. You can add, remove, and query for URLs in the browser's
  /// history. To override the history page with your own version, see [Override
  /// Pages](develop/ui/override-chrome-pages).
  JSHistory get history {
    var historyNullable = this.historyNullable;
    if (historyNullable == null) {
      throw ApiNotAvailableException('chrome.history');
    }
    return historyNullable;
  }
}

extension type JSHistory._(JSObject _) {
  /// Searches the history for the last visit time of each page matching the
  /// query.
  external JSPromise search(SearchQuery query);

  /// Retrieves information about visits to a URL.
  external JSPromise getVisits(UrlDetails details);

  /// Adds a URL to the history at the current time with a [transition
  /// type](#transition_types) of "link".
  external JSPromise addUrl(UrlDetails details);

  /// Removes all occurrences of the given URL from the history.
  external JSPromise deleteUrl(UrlDetails details);

  /// Removes all items within the specified date range from the history.  Pages
  /// will not be removed from the history unless all visits fall within the
  /// range.
  external JSPromise deleteRange(DeleteRangeRange range);

  /// Deletes all items from the history.
  external JSPromise deleteAll();

  /// Fired when a URL is visited, providing the HistoryItem data for that URL.
  /// This event fires before the page has loaded.
  external Event get onVisited;

  /// Fired when one or more URLs are removed from the history service.  When
  /// all visits have been removed the URL is purged from history.
  external Event get onVisitRemoved;
}

/// The [transition type](#transition_types) for this visit from its referrer.
typedef TransitionType = JSString;
extension type HistoryItem._(JSObject _) implements JSObject {
  external factory HistoryItem({
    /// The unique identifier for the item.
    String id,

    /// The URL navigated to by a user.
    String? url,

    /// The title of the page when it was last loaded.
    String? title,

    /// When this page was last loaded, represented in milliseconds since the
    /// epoch.
    double? lastVisitTime,

    /// The number of times the user has navigated to this page.
    int? visitCount,

    /// The number of times the user has navigated to this page by typing in the
    /// address.
    int? typedCount,
  });

  /// The unique identifier for the item.
  external String id;

  /// The URL navigated to by a user.
  external String? url;

  /// The title of the page when it was last loaded.
  external String? title;

  /// When this page was last loaded, represented in milliseconds since the
  /// epoch.
  external double? lastVisitTime;

  /// The number of times the user has navigated to this page.
  external int? visitCount;

  /// The number of times the user has navigated to this page by typing in the
  /// address.
  external int? typedCount;
}
extension type VisitItem._(JSObject _) implements JSObject {
  external factory VisitItem({
    /// The unique identifier for the corresponding [history.HistoryItem].
    String id,

    /// The unique identifier for this visit.
    String visitId,

    /// When this visit occurred, represented in milliseconds since the epoch.
    double? visitTime,

    /// The visit ID of the referrer.
    String referringVisitId,

    /// The [transition type](#transition_types) for this visit from its referrer.
    TransitionType transition,

    /// True if the visit originated on this device. False if it was synced from a
    /// different device.
    bool isLocal,
  });

  /// The unique identifier for the corresponding [history.HistoryItem].
  external String id;

  /// The unique identifier for this visit.
  external String visitId;

  /// When this visit occurred, represented in milliseconds since the epoch.
  external double? visitTime;

  /// The visit ID of the referrer.
  external String referringVisitId;

  /// The [transition type](#transition_types) for this visit from its referrer.
  external TransitionType transition;

  /// True if the visit originated on this device. False if it was synced from a
  /// different device.
  external bool isLocal;
}
extension type UrlDetails._(JSObject _) implements JSObject {
  external factory UrlDetails(
      {
      /// The URL for the operation. It must be in the format as returned from a
      /// call to history.search.
      String url});

  /// The URL for the operation. It must be in the format as returned from a
  /// call to history.search.
  external String url;
}
extension type OnVisitRemovedRemoved._(JSObject _) implements JSObject {
  external factory OnVisitRemovedRemoved({
    /// True if all history was removed.  If true, then urls will be empty.
    bool allHistory,
    JSArray? urls,
  });

  /// True if all history was removed.  If true, then urls will be empty.
  external bool allHistory;

  external JSArray? urls;
}
extension type SearchQuery._(JSObject _) implements JSObject {
  external factory SearchQuery({
    /// A free-text query to the history service.  Leave empty to retrieve all
    /// pages.
    String text,

    /// Limit results to those visited after this date, represented in
    /// milliseconds since the epoch. If not specified, this defaults to 24 hours
    /// in the past.
    double? startTime,

    /// Limit results to those visited before this date, represented in
    /// milliseconds since the epoch.
    double? endTime,

    /// The maximum number of results to retrieve.  Defaults to 100.
    int? maxResults,
  });

  /// A free-text query to the history service.  Leave empty to retrieve all
  /// pages.
  external String text;

  /// Limit results to those visited after this date, represented in
  /// milliseconds since the epoch. If not specified, this defaults to 24 hours
  /// in the past.
  external double? startTime;

  /// Limit results to those visited before this date, represented in
  /// milliseconds since the epoch.
  external double? endTime;

  /// The maximum number of results to retrieve.  Defaults to 100.
  external int? maxResults;
}
extension type DeleteRangeRange._(JSObject _) implements JSObject {
  external factory DeleteRangeRange({
    /// Items added to history after this date, represented in milliseconds since
    /// the epoch.
    double startTime,

    /// Items added to history before this date, represented in milliseconds since
    /// the epoch.
    double endTime,
  });

  /// Items added to history after this date, represented in milliseconds since
  /// the epoch.
  external double startTime;

  /// Items added to history before this date, represented in milliseconds since
  /// the epoch.
  external double endTime;
}
