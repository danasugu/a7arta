import 'package:flutter/material.dart';


class Minute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MinutePage(),
    );
  }
}

class MinutePage extends StatefulWidget {
  @override
  _MinutePageState createState() => new _MinutePageState();
}

class _MinutePageState extends State<MinutePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(resizeToAvoidBottomInset: true,
        body:
        Padding(
          padding: const EdgeInsets.fromLTRB(13.0, 0.0, 15.0, 0.0),
          child: Container(
            child: new Stack(
              children: <Widget>[
                ClipPath(
                  child: Container(color: Color(0xFF9f0000).withOpacity(1.0)),
                  clipper: getClipper(),
                ),
                Positioned(
                  width: 300.0,
                  top: MediaQuery.of(context).size.height / 211,
                  child: Container(
                    child: Column(
                        children: <Widget>[
                          Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://a7arta.ro/wp-content/uploads/2015/09/IMG_38151-150x150.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                                  ])),
                          SizedBox(height: 10.0),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(13.0, 5.0, 15.0, 51.0),
                              child: Center(
                                child: Text(
                                  'Trece un minut, in varful picioarelor si te lasa sa citesti ceea ce am de spus despre mine. Atat iti ia sa citesti: un minut. Asadar, ce sa iti spun? \n\nImi place teatrul si sunt pasionata de filme. Scriu cu placere daca ma impresioneaza ceva si nu scriu daca nu ma atinge, nu ma misca si nu ma inspira cu nimic un subiect. \n\nAm inceput dintr-o joaca, in liceu, iar mai tarziu au fost cativa oameni (in afara de familie si prieteni) care au contribuit la formarea mea: Horace, Florin Piersic jr., Cristi China-Birta si Dan Boicea. \n\nAsteapta numai un minut, care trece incet, uitandu-se fix la tine. Apoi mergi mai departe cu lectura.\n\na7arta se citeste peste tot. ',
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
//                          SizedBox(height: 10.0),
//
//

                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );

  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(55.0, size.height / 4.7);
    path.lineTo(size.width - 111, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}