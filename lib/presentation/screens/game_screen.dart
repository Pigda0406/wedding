

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:martin_michelle/presentation/pages/mobile/single_chat_page_mobile.dart';
import 'package:martin_michelle/presentation/pages/tablet/single_chat_page_tablet.dart';
import 'package:martin_michelle/presentation/pages/web/single_chat_page_web.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameScreen extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
          initialUrl: "https://www.google.com/webhp?hl=zh-TW&sa=X&ved=0ahUKEwiKzZ3P5_X2AhUpyosBHVPHDVkQPAgI",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
  }

