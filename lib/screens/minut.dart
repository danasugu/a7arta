import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UnMinut extends StatefulWidget {
  @override
  _UnMinutState createState() => _UnMinutState();
}

class _UnMinutState extends State<UnMinut> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(elevation: 0.0,),
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Color(0xFF9f0000).withOpacity(1.0)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 193,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 110.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://a7arta.ro/wp-content/uploads/2015/09/IMG_38151-150x150.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(55.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    SizedBox(height: 5.0),
                    Text(
                      'Un minut',
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 5.0, 11.0, 51.0),
                      child: Text(
                        'Trece un minut, in varful picioarelor si te lasa sa citesti ceea ce am de spus despre mine. Atat iti ia sa citesti: un minut. Asadar, ce sa iti spun? \n\nImi place teatrul si sunt pasionata de filme. Scriu cu placere daca ma impresioneaza ceva si nu scriu daca nu ma atinge, nu ma misca si nu ma inspira cu nimic un subiect. \nAm inceput dintr-o joaca, in liceu, iar mai tarziu au fost cativa oameni (in afara de familie si prieteni) care au contribuit la formarea mea: Horace, Florin Piersic jr., Cristi China-Birta si Dan Boicea. \nAsteapta numai un minut, care trece incet, uitandu-se fix la tine. Apoi mergi mai departe cu lectura.\na7arta se citeste peste tot. ',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                    ),


                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.4);
    path.lineTo(size.width + 111, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}