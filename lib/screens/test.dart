import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://a7arta.ro',
//      appBar: AppBar(
//        title: Text("a7arta"),
//      ),
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
      enableAppScheme: true,
    );
  }
}
