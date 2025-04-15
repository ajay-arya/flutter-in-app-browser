import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_in_app_browser_platform_interface.dart';

class MethodChannelFlutterInAppBrowser extends FlutterInAppBrowserPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_in_app_browser');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
