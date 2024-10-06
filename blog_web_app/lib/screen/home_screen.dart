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

        // AppBar에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
              onPressed: (){webViewController.goBack();},
              icon: Icon(
                Icons.arrow_back
              ),
          ),
          IconButton(
            onPressed: (){
            webViewController.loadRequest(Uri.parse('https://blog.codefactory.ai'));
            },
            icon: Icon(
              Icons.home
            ),
          ),
          IconButton(
              onPressed: (){webViewController.goForward();},
              icon: Icon(
                  Icons.arrow_forward
              )
          ),
        ],
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}