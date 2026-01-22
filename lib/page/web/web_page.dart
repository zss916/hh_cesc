import 'package:cescpro/components/common_app_bar.dart';
import 'package:cescpro/core/service/device_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController webViewController;
  String _lastUrl = "";
  String url = "";
  String title = "";
  String javaScriptChannelName = "app";
  @override
  void initState() {
    super.initState();
    var arguments = Get.arguments as Map<String, dynamic>;
    title = arguments["title"];
    url = arguments["url"];
    initWebController();
  }

  @override
  void dispose() {
    super.dispose();
    webViewController.clearLocalStorage();
    webViewController.clearCache();
    webViewController.removeJavaScriptChannel(javaScriptChannelName);
  }

  void initWebController() {
    webViewController = WebViewController()
      ..addJavaScriptChannel(javaScriptChannelName, onMessageReceived: (e) {})
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("progress: $progress");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (!request.url.startsWith('http')) {
              if (await launchUrl(Uri.parse(request.url))) {
                return NavigationDecision.prevent;
              }
            }
            if (_lastUrl == request.url) {
              return NavigationDecision.navigate;
            } else {
              webViewController.loadRequest(
                Uri.parse(request.url),
                headers: {"referer": _lastUrl},
              );
              _lastUrl = request.url;
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadFlutterAsset(url);
    _lastUrl = url;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: DeviceService.to.isBottomPadding,
      child: Scaffold(
        appBar: baseAppBar(title: title),
        backgroundColor: Colors.white,
        body: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
