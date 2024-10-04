import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget{
  WebViewController webViewController = WebViewController()

  ..loadRequest(Uri.parse('https://blog.codefactory.ai/'))

    // 자바스크립트 실행가능
  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,

        title: Text('Blog Web App'),

        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}