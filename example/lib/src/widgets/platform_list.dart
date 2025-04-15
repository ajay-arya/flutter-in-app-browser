import 'package:flutter/material.dart';
import 'package:flutter_in_app_browser/flutter_in_app_browser.dart';

class PlatformList extends StatelessWidget {
  const PlatformList({super.key});

  @override
  Widget build(BuildContext context) {
    final platforms = FlutterInAppBrowser().getAvailablePlatforms();
    final browser = FlutterInAppBrowser();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: MediaQuery.of(context).size.height - kToolbarHeight - 16,
      ),
      child: ListView.builder(
        itemCount: platforms.length,
        itemBuilder: (context, index) {
          final platform = platforms[index];
          return ListTile(
            title: Text(platform.name),
            subtitle: Text(platform.url),
            onTap: () async {
              final response = await browser
                  .get(platform.name, params: {"url": platform.url});
              print("Response: $response");
            },
          );
        },
      ),
    );
  }
}
