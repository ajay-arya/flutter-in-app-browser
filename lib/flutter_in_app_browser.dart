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
}
