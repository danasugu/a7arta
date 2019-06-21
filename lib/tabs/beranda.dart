import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import '../screens/beritapost.dart' as _beritaPostPage;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeMain> {
  // Base URL for our wordpress API
  final String apiUrl = "http://a7arta.ro/wp-json/wp/v2/";

  // Empty list for our posts
  List posts;

  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"),
        headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 31.0,
      mainAxisSpacing: 22.0,
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      children: <Widget>[
        _buildTile(
          Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                       Image.asset('images/logo.png'),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),

        ListView.builder(
          itemCount: posts == null ? 0 : posts.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildTile(
              Column(
                children: <Widget>[
                  new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: posts[index]["featured_media"] == 0
                        ? 'http://a7arta.ro/wp-content/uploads/2017/01/logo-1.png'
                        : posts[index]["_embedded"]["wp:featuredmedia"][0]
                            ["source_url"],
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new ListTile(
                      title: new Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: new Text(posts[index]["title"]["rendered"])),
                      subtitle: new Text(posts[index]["excerpt"]["rendered"]
                          .replaceAll(new RegExp(r'<[^>]*>'), '')),
                    ),
                  ),
                  new ButtonTheme.bar(
                    child: new ButtonBar(
                      children: <Widget>[
                        new FlatButton(
                          child: const Text('READ MORE'),color: Color(0xFF9f0000), textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) =>
                                    new _beritaPostPage.a7arta(
                                        post: posts[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 125.0),
        StaggeredTile.extent(2, 700.0),
      ],
    ));
  }
}

Widget _buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(0.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child
      )
  );
}
