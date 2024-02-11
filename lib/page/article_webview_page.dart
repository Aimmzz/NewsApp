import 'package:flutter/material.dart';
import 'package:news_app/widget/costume_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {

  static const routeName = '/article_web';
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return CostumeScaffold(
      body: WebViewWidget(
        controller: controller,
        ) 
    );
  }
}