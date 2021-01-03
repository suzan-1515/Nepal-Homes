import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDescription extends StatefulWidget {
  final String description;

  const NewsDescription({Key key, @required this.description})
      : super(key: key);

  @override
  _NewsDescriptionState createState() => _NewsDescriptionState();
}

class _NewsDescriptionState extends State<NewsDescription> {
  WebViewController _controller;
  double _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: _height,
      child: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _controller.loadUrl(
            Uri.dataFromString(widget.description,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'))
                .toString(),
          );
        },
        onPageFinished: (some) async {
          double height = double.parse(await _controller
              .evaluateJavascript("document.documentElement.scrollHeight;"));
          setState(() {
            this._height = height;
          });
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
