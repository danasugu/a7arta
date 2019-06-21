import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class InterviuriPage extends StatefulWidget {
  @override
  _InterviuriPageState createState() => _InterviuriPageState(
  );
}

class _InterviuriPageState extends State<InterviuriPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(enableAppScheme: true,
      url: "http://a7arta.ro/category/evenimente/",
      withJavascript: true,

    );
  }
}
