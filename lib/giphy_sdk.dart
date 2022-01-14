import 'dart:async';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class GiphySdk {
  static const MethodChannel _channel = MethodChannel('giphy_sdk');

  //methods
  static const String methodConnectToGiphy = "connectToGiphy";

  // parameters
  static const String paramApiKey = "apiKey";

  //logging
  static final Logger _logger = Logger(
    //filter: CustomLogFilter(), // custom logfilter can be used to have logs in release mode
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
    ),
  );

  /// Opens the Giphy Selection and returns a [bool] if everything worked
  ///
  /// Required parameters are the [apiKey] to
  /// authenticate with the Giphy Api
  /// Throws a [PlatformException] if connecting to the remote api failed
  /// Throws a [MissingPluginException] if the method is not implemented on
  /// the native platforms.
  static Future<bool> openGiphySelection({required String apiKey}) async {
    try {
      var result = await _channel.invokeMethod(methodConnectToGiphy, {
        paramApiKey: apiKey,
      });
      return result;
    } on Exception catch (e) {
      _logException(methodConnectToGiphy, e);
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
