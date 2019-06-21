import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TeatruPage extends StatefulWidget {
  @override
  _TeatruPageState createState() => _TeatruPageState();
}

class _TeatruPageState extends State<TeatruPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://a7arta.ro/category/teatru/",
      withJavascript: true,

    );
  }
}
