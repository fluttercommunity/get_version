import 'dart:async';

import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

class GetVersion {
  static const MethodChannel _channel =
      const MethodChannel('get_version');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get projectVersion async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  static Future<String> get projectCode async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String buildNumber = packageInfo.buildNumber;
    return buildNumber;
  }

  static Future<String> get appID async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    return packageName;
  }

  static Future<String> get appName async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
     String appName = packageInfo.appName;
    return appName;
  }
}
