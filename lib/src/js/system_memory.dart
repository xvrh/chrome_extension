// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';
import 'system.dart';

export 'chrome.dart';
export 'system.dart';

extension JSChromeJSSystemMemoryExtension on JSChromeSystem {
  @JS('memory')
  external JSSystemMemory? get memoryNullable;

  /// The `chrome.system.memory` API.
  JSSystemMemory get memory {
    var memoryNullable = this.memoryNullable;
    if (memoryNullable == null) {
      throw ApiNotAvailableException('chrome.system.memory');
    }
    return memoryNullable;
  }
}

extension type JSSystemMemory._(JSObject _) {
  /// Get physical memory information.
  external JSPromise getInfo();
}
extension type MemoryInfo._(JSObject _) implements JSObject {
  external factory MemoryInfo({
    /// The total amount of physical memory capacity, in bytes.
    double capacity,

    /// The amount of available capacity, in bytes.
    double availableCapacity,
  });

  /// The total amount of physical memory capacity, in bytes.
  external double capacity;

  /// The amount of available capacity, in bytes.
  external double availableCapacity;
}
