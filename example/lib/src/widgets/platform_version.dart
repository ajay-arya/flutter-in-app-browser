import 'package:flutter/material.dart';
import 'package:flutter_in_app_browser/flutter_in_app_browser.dart';

class PlatformVersion extends StatefulWidget {
  const PlatformVersion({super.key});

  @override
  State<PlatformVersion> createState() => _PlatformVersionState();
}

class _PlatformVersionState extends State<PlatformVersion> {
  String _platformVersion = 'Unknown';
  final _flutterInAppBrowserPlugin = FlutterInAppBrowser();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _flutterInAppBrowserPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on Exception {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Running on: $_platformVersion\n',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
