import 'dart:async';

import 'package:flutter/services.dart';

class GetVersion {
  static const MethodChannel _channel =
      const MethodChannel('get_version');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get projectVersion async {
    final String versionName = await _channel.invokeMethod('getProjectVersion');
    return versionName;
  }

  static Future<String> get projectCode async {
    final String versionCode = await _channel.invokeMethod('getProjectCode');
    return versionCode;
  }
}
