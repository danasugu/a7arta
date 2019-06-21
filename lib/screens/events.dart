import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState(
  );
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(enableAppScheme: true,
      url: "http://a7arta.ro/category/evenimente/",
      withJavascript: true,

    );
  }
}
