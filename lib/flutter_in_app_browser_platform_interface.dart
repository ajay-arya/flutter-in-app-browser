import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_in_app_browser_method_channel.dart';

abstract class FlutterInAppBrowserPlatform extends PlatformInterface {
  FlutterInAppBrowserPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterInAppBrowserPlatform _instance =
      MethodChannelFlutterInAppBrowser();

  static FlutterInAppBrowserPlatform get instance => _instance;

  static set instance(FlutterInAppBrowserPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
