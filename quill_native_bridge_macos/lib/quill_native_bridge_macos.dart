// This file is referenced by pubspec.yaml. If you plan on moving this file
// Make sure to update pubspec.yaml to the new location.

import 'package:flutter/foundation.dart';
import 'package:quill_native_bridge_platform_interface/quill_native_bridge_platform_interface.dart';

import 'src/messages.g.dart';

/// An implementation of [QuillNativeBridgePlatform] for macOS.
class QuillNativeBridgeMacOS extends QuillNativeBridgePlatform {
  final QuillNativeBridgeApi _hostApi = QuillNativeBridgeApi();

  /// Registers this class as the default instance of [QuillNativeBridgePlatform].
  static void registerWith() {
    QuillNativeBridgePlatform.instance = QuillNativeBridgeMacOS();
  }

  @override
  Future<bool> isSupported(QuillNativeBridgeFeature feature) async => {
        QuillNativeBridgeFeature.getClipboardHtml,
        QuillNativeBridgeFeature.copyHtmlToClipboard,
        QuillNativeBridgeFeature.copyImageToClipboard,
        QuillNativeBridgeFeature.getClipboardImage,
        QuillNativeBridgeFeature.getClipboardFiles,
      }.contains(feature);

  @override
  Future<bool> isIOSSimulator() => throw UnsupportedError(
        'isIOSSimulator() is only supported on iOS.',
      );

  @override
  Future<String?> getClipboardHtml() => _hostApi.getClipboardHtml();

  @override
  Future<void> copyHtmlToClipboard(String html) =>
      _hostApi.copyHtmlToClipboard(html);

  @override
  Future<Uint8List?> getClipboardImage() => _hostApi.getClipboardImage();

  @override
  Future<void> copyImageToClipboard(Uint8List imageBytes) =>
      _hostApi.copyImageToClipboard(imageBytes);

  @override
  Future<Uint8List?> getClipboardGif() => _hostApi.getClipboardGif();

  @override
  Future<List<String>> getClipboardFiles() => _hostApi.getClipboardFiles();
}
