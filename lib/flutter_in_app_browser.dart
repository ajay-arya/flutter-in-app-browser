import 'flutter_in_app_browser_platform_interface.dart';
import 'data/platforms.dart';
import 'models/platform.dart';

class FlutterInAppBrowser {
  Future<String?> getPlatformVersion() {
    return FlutterInAppBrowserPlatform.instance.getPlatformVersion();
  }

  List<Platform> getAvailablePlatforms() {
    return availablePlatforms;
  }

  Future get(String name, {Map<String, dynamic>? params}) async {
    final responseMap =
        await FlutterInAppBrowserPlatform.instance.get(name, params: params);
    return responseMap;
  }
}
