import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_in_app_browser/flutter_in_app_browser.dart';
import 'package:flutter_in_app_browser/flutter_in_app_browser_platform_interface.dart';
import 'package:flutter_in_app_browser/flutter_in_app_browser_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterInAppBrowserPlatform
    with MockPlatformInterfaceMixin
    implements FlutterInAppBrowserPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterInAppBrowserPlatform initialPlatform = FlutterInAppBrowserPlatform.instance;

  test('$MethodChannelFlutterInAppBrowser is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterInAppBrowser>());
  });

  test('getPlatformVersion', () async {
    FlutterInAppBrowser flutterInAppBrowserPlugin = FlutterInAppBrowser();
    MockFlutterInAppBrowserPlatform fakePlatform = MockFlutterInAppBrowserPlatform();
    FlutterInAppBrowserPlatform.instance = fakePlatform;

    expect(await flutterInAppBrowserPlugin.getPlatformVersion(), '42');
  });
}
