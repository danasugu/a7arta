import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class a7arta extends StatelessWidget {

  var post;
  a7arta({Key key, @required var this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(post['title']['rendered']),
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 22.0, 8.0),
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: post["featured_media"] == 0
                    ? 'http://a7arta.ro/wp-content/uploads/2017/01/logo-1.png'
                    : post["_embedded"]["wp:featuredmedia"][0]["source_url"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15.0, 22.0, 8.0),
//                child: new HtmlView(data: post['content']['rendered'].replaceAll(new RegExp(r'<[^>]*>'), ''))
              child: new Text(post['content']['rendered'].replaceAll(new RegExp(r'<[^>]*>'), '')),
            )
          ],
        ),
      ),
    );
  }
}