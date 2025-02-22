// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSTabGroupsExtension on JSChrome {
  @JS('tabGroups')
  external JSTabGroups? get tabGroupsNullable;

  /// Use the `chrome.tabGroups` API to interact with the browser's tab grouping
  /// system. You can use this API to modify and rearrange tab groups in the
  /// browser. To group and ungroup tabs, or to query what tabs are in groups,
  /// use the `chrome.tabs` API.
  JSTabGroups get tabGroups {
    var tabGroupsNullable = this.tabGroupsNullable;
    if (tabGroupsNullable == null) {
      throw ApiNotAvailableException('chrome.tabGroups');
    }
    return tabGroupsNullable;
  }
}

extension type JSTabGroups._(JSObject _) {
  /// Retrieves details about the specified group.
  external JSPromise get(int groupId);

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  external JSPromise query(QueryInfo queryInfo);

  /// Modifies the properties of a group. Properties that are not specified in
  /// [updateProperties] are not modified.
  external JSPromise update(
    /// The ID of the group to modify.
    int groupId,
    UpdateProperties updateProperties,
  );

  /// Moves the group and all its tabs within its window, or to a new window.
  external JSPromise move(
    /// The ID of the group to move.
    int groupId,
    MoveProperties moveProperties,
  );

  /// Fired when a group is created.
  external Event get onCreated;

  /// Fired when a group is updated.
  external Event get onUpdated;

  /// Fired when a group is moved within a window. Move events are still fired
  /// for the individual tabs within the group, as well as for the group itself.
  /// This event is not fired when a group is moved between windows; instead, it
  /// will be removed from one window and created in another.
  external Event get onMoved;

  /// Fired when a group is closed, either directly by the user or automatically
  /// because it contained zero tabs.
  external Event get onRemoved;

  /// An ID that represents the absence of a group.
  external int get TAB_GROUP_ID_NONE;
}

/// The group's color.
typedef Color = JSString;
extension type TabGroup._(JSObject _) implements JSObject {
  external factory TabGroup({
    /// The ID of the group. Group IDs are unique within a browser session.
    int id,

    /// Whether the group is collapsed. A collapsed group is one whose tabs are
    /// hidden.
    bool collapsed,

    /// The group's color.
    Color color,

    /// The title of the group.
    String? title,

    /// The ID of the window that contains the group.
    int windowId,
  });

  /// The ID of the group. Group IDs are unique within a browser session.
  external int id;

  /// Whether the group is collapsed. A collapsed group is one whose tabs are
  /// hidden.
  external bool collapsed;

  /// The group's color.
  external Color color;

  /// The title of the group.
  external String? title;

  /// The ID of the window that contains the group.
  external int windowId;
}
extension type QueryInfo._(JSObject _) implements JSObject {
  external factory QueryInfo({
    /// Whether the groups are collapsed.
    bool? collapsed,

    /// The color of the groups.
    Color? color,

    /// Match group titles against a pattern.
    String? title,

    /// The ID of the parent window, or [windows.WINDOW_ID_CURRENT] for the
    /// [current window](windows#current-window).
    int? windowId,
  });

  /// Whether the groups are collapsed.
  external bool? collapsed;

  /// The color of the groups.
  external Color? color;

  /// Match group titles against a pattern.
  external String? title;

  /// The ID of the parent window, or [windows.WINDOW_ID_CURRENT] for the
  /// [current window](windows#current-window).
  external int? windowId;
}
extension type UpdateProperties._(JSObject _) implements JSObject {
  external factory UpdateProperties({
    /// Whether the group should be collapsed.
    bool? collapsed,

    /// The color of the group.
    Color? color,

    /// The title of the group.
    String? title,
  });

  /// Whether the group should be collapsed.
  external bool? collapsed;

  /// The color of the group.
  external Color? color;

  /// The title of the group.
  external String? title;
}
extension type MoveProperties._(JSObject _) implements JSObject {
  external factory MoveProperties({
    /// The window to move the group to. Defaults to the window the group is
    /// currently in. Note that groups can only be moved to and from windows with
    /// [windows.WindowType] type `"normal"`.
    int? windowId,

    /// The position to move the group to. Use `-1` to place the group at the end
    /// of the window.
    int index,
  });

  /// The window to move the group to. Defaults to the window the group is
  /// currently in. Note that groups can only be moved to and from windows with
  /// [windows.WindowType] type `"normal"`.
  external int? windowId;

  /// The position to move the group to. Use `-1` to place the group at the end
  /// of the window.
  external int index;
}
