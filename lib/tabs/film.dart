import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FilmePage extends StatefulWidget {
  @override
  _FilmePageState createState() => _FilmePageState(
  );
}

class _FilmePageState extends State<FilmePage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(enableAppScheme: true,
      url: "http://a7arta.ro/category/1001-filme/",
      withJavascript: true,

    );
  }
}
