import 'package:cescpro/components/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'webview_logic.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: (Get.arguments["title"] as String?) ?? ""),
      body: GetBuilder<WebViewLogic>(
        init: WebViewLogic(),
        builder: (logic) {
          return Column(
            children: [
              if (logic.progress < 1)
                LinearProgressIndicator(value: logic.progress),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest:
                      (!(Get.arguments["url"]).startsWith("http"))
                      ? null
                      : URLRequest(url: WebUri(Get.arguments["url"])),
                  initialFile: (!(Get.arguments["url"]).startsWith("http"))
                      ? Get.arguments["url"]
                      : null,
                  initialSettings: InAppWebViewSettings(
                    useShouldOverrideUrlLoading: true,
                    mediaPlaybackRequiresUserGesture: false,
                  ),
                  onWebViewCreated: (controller) {
                    // 可以在这里执行一些初始化操作
                  },
                  onLoadStart: (controller, url) {
                    // 页面开始加载时的操作
                  },
                  onLoadStop: (controller, url) async {
                    // 页面加载完成时的操作
                    logic.progress = 1.0;
                    logic.update();
                  },
                  onReceivedError: (controller, url, error) {
                    // 页面加载错误时的操作
                    logic.progress = 0.0;
                    logic.update();
                  },
                  onProgressChanged: (controller, progress) {
                    logic.progress = progress / 100.0;
                    logic.update();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
