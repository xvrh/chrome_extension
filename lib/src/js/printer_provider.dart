// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSPrinterProviderExtension on JSChrome {
  @JS('printerProvider')
  external JSPrinterProvider? get printerProviderNullable;

  /// The `chrome.printerProvider` API exposes events used by print
  /// manager to query printers controlled by extensions, to query their
  /// capabilities and to submit print jobs to these printers.
  JSPrinterProvider get printerProvider {
    var printerProviderNullable = this.printerProviderNullable;
    if (printerProviderNullable == null) {
      throw ApiNotAvailableException('chrome.printerProvider');
    }
    return printerProviderNullable;
  }
}

extension type JSPrinterProvider._(JSObject _) {
  /// Event fired when print manager requests printers provided by extensions.
  /// |resultCallback|: Callback to return printer list. Every listener must
  /// call callback exactly once.
  external Event get onGetPrintersRequested;

  /// Event fired when print manager requests information about a USB device
  /// that may be a printer.
  /// _Note:_ An application should not rely on this event being
  /// fired more than once per device. If a connected device is supported it
  /// should be returned in the [onGetPrintersRequested] event.
  /// |device|: The USB device.
  /// |resultCallback|: Callback to return printer info. The receiving listener
  /// must call callback exactly once. If the parameter to this callback is
  /// undefined that indicates that the application has determined that the
  /// device is not supported.
  external Event get onGetUsbPrinterInfoRequested;

  /// Event fired when print manager requests printer capabilities.
  /// |printerId|: Unique ID of the printer whose capabilities are requested.
  /// |resultCallback|: Callback to return device capabilities in
  /// <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
  /// format</a>.
  /// The receiving listener must call callback exectly once.
  external Event get onGetCapabilityRequested;

  /// Event fired when print manager requests printing.
  /// |printJob|: The printing request parameters.
  /// |resultCallback|: Callback that should be called when the printing
  /// request is completed.
  external Event get onPrintRequested;
}

/// Error codes returned in response to [onPrintRequested] event.
typedef PrintError = JSString;

typedef PrintersCallback = JSFunction;

typedef PrinterInfoCallback = JSFunction;

/// |capabilities|: Device capabilities in
/// <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
/// format</a>.
typedef CapabilitiesCallback = JSFunction;

typedef PrintCallback = JSFunction;
extension type PrinterInfo._(JSObject _) implements JSObject {
  external factory PrinterInfo({
    /// Unique printer ID.
    String id,

    /// Printer's human readable name.
    String name,

    /// Printer's human readable description.
    String? description,
  });

  /// Unique printer ID.
  external String id;

  /// Printer's human readable name.
  external String name;

  /// Printer's human readable description.
  external String? description;
}
extension type PrintJob._(JSObject _) implements JSObject {
  external factory PrintJob({
    /// ID of the printer which should handle the job.
    String printerId,

    /// The print job title.
    String title,

    /// Print ticket in
    /// <a href="https://developers.google.com/cloud-print/docs/cdd#cjt">
    /// CJT format</a>.
    /// <aside class="aside flow bg-state-info-bg color-state-info-text">
    /// <div class="flow">The CJT reference is marked as deprecated. It is
    /// deprecated for Google Cloud Print only. is not deprecated for
    /// ChromeOS printing.
    /// </div>
    /// </aside>
    JSAny ticket,

    /// The document content type. Supported formats are
    /// `"application/pdf"` and `"image/pwg-raster"`.
    String contentType,

    /// Blob containing the document data to print. Format must match
    /// |contentType|.
    JSObject document,
  });

  /// ID of the printer which should handle the job.
  external String printerId;

  /// The print job title.
  external String title;

  /// Print ticket in
  /// <a href="https://developers.google.com/cloud-print/docs/cdd#cjt">
  /// CJT format</a>.
  /// <aside class="aside flow bg-state-info-bg color-state-info-text">
  /// <div class="flow">The CJT reference is marked as deprecated. It is
  /// deprecated for Google Cloud Print only. is not deprecated for
  /// ChromeOS printing.
  /// </div>
  /// </aside>
  external JSAny ticket;

  /// The document content type. Supported formats are
  /// `"application/pdf"` and `"image/pwg-raster"`.
  external String contentType;

  /// Blob containing the document data to print. Format must match
  /// |contentType|.
  external JSObject document;
}
