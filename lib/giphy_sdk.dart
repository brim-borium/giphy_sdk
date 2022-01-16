import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:giphy_sdk/models/giphy_settings.dart';
import 'package:logger/logger.dart';

import 'models/giphy_media.dart';
import 'platform_channels.dart';

export 'package:giphy_sdk/models/giphy_settings.dart';

export 'extensions/enum_list_extensions.dart';

///
/// [GiphySdk] holds the functionality to connect and use the GiphySdk
///
class GiphySdk {
  // mehtod channels
  static const MethodChannel _channel = MethodChannel('giphy_sdk');

  // logging
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  /// Opens the Giphy Selection and returns a [GiphyMedia] object when the user
  /// selects a gif.
  ///
  /// Required parameters are the [apiKey] to
  /// authenticate with the Giphy Api.
  /// You can optional use [giphySettings] to change the configuration of the
  /// gif selection.
  /// Throws a [PlatformException] if connecting to the remote api failed
  /// Throws a [MissingPluginException] if the method is not implemented on
  /// the native platforms.
  static Future<GiphyMedia?> openGiphySelection({
    required String apiKey,
    GiphySettings giphySettings = const GiphySettings(),
  }) async {
    try {
      var giphyMediaJson = await _channel.invokeMethod<String>(
        MethodNames.openGiphySelection,
        {
          ParameterNames.apiKey: apiKey,
          ParameterNames.giphySettings: giphySettings.toJson(),
        },
      );

      if (giphyMediaJson == null || giphyMediaJson.isEmpty) {
        return null;
      }
      var giphyMediaMap = jsonDecode(giphyMediaJson) as Map<String, dynamic>;
      var giphyMedia = GiphyMedia.fromJson(giphyMediaMap);
      return giphyMedia;
    } on Exception catch (e) {
      _logException(MethodNames.openGiphySelection, e);
      rethrow;
    }
  }

  static void _logException(String method, Exception e) {
    if (e is PlatformException) {
      var message = e.message ?? '';
      message += e.details != null ? '\n${e.details}' : '';
      _logger.e('$method failed with: $message');
    } else if (e is MissingPluginException) {
      _logger.e('$method not implemented');
    } else {
      _logger.e('$method throws unhandled exception: ${e.toString()}');
    }
  }
}
