
import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatefulWidget {
  final String url;
  final String name;
  const NewsWebViewScreen({super.key, required this.url, required this.name});

  @override
  State<NewsWebViewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<NewsWebViewScreen> {

late WebViewController controller;
@override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
// Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        iconTheme:IconThemeData(color:Color(0xff266daf)),
          centerTitle: true,
          title: Text('Web Page',style: TextStyle(color:Color(0xff266daf),fontSize:24),)),
      body: WebViewWidget(controller: controller),
    );
  }
}