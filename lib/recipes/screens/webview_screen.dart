import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/recipes/models/models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  // MaterialPage Helper
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.kinit,
      key: ValueKey(Pages.kinit),
      child: const WebViewScreen(),
    );
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kinit.lk'),
      ),
      body: const WebView(
        initialUrl: 'https://www.kinit.lk/',
      ),
    );
  }
}
