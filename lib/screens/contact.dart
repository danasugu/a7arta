import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(new MaterialApp(
    home: new ContactMe(),
  ));
}

class ContactMe extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<ContactMe> {

  void _showUrl() {
    _launch('http://a7arta.ro');
  }

  void _showEmail() {
    _launch('mailto:film.teatru@gmail.com');
  }

  void _showTelephone() {
    _launch('tel:+40723720074');
  }

  void _showSms() {
    _launch('sms:+40723720074');
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.transparent,
////        \ backgroundColor: Color(0xFFf4f3f9),
//        elevation: 0.0,
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          color: Colors.black,
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//        title: new Text(''),
//      ),
      body: ListView(
        shrinkWrap: true,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://chaincuttersunion.co/wp-content/uploads/2018/05/black-and-white-abstract-drawings-painting-art-figurative-fish-drawing-south-by.jpg'),
                              fit: BoxFit.cover),
                          
                        ),
                      ),
                      Container(
                        height: 620.0,
                          padding: EdgeInsets.only(left:1.0, right: 10.0),
                        child: Row(
                          children: <Widget>[ SizedBox(height: 30.0),
                            Container(
                              height: 251.0,
                              width: (MediaQuery.of(context).size.width - 30.0) /2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(33.0, 30.0, 33.0, 31.0),
                                child: Container(
                                  color: Colors.black.withOpacity(0.79),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(1.0, 19.0, 1.0, 15.0),
                                    child: Column(
                                      children: <Widget>[
                                        FlatButton.icon(onPressed: _showEmail,
                                            icon: Icon(Icons.email, size: 30.0,color: Colors.white), label: Text('', style: TextStyle(color: Colors.white70),)),
                                        FlatButton.icon(onPressed: _showSms,
                                            icon: Icon(Icons.sms, size: 30.0, color: Colors.white), label: Text('', style: TextStyle(color: Colors.white70),)),
                                        FlatButton.icon(onPressed: _showTelephone,
                                            icon: Icon(Icons.phone,  size: 30.0, color: Colors.white), label: Text('', style: TextStyle(color: Colors.white70),)),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height:280.0,
                              width: (MediaQuery.of(context).size.width - 30.0) /2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 210.0,
                                    width: 250.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xFF9f0000).withOpacity(0.79)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(18.0, 40.0, 8.0, 36.0),
                                      child: Text('Contacteaza-ma pentru orice eveniment \nlegat de \nteatru si film. \nSi eu scriu.',
                                      style: TextStyle(color: Colors.white, fontSize: 18.0),softWrap: true,),
                                    )

                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ],
            )
          ],
      )

//      new Container(
//          color: Color(0xFF9f0000),
//          padding: new EdgeInsets.all(32.0),
//          child: new Center(
//            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                new RaisedButton(
//                  color:Color(0xFF9f0000), textColor: Colors.white,elevation: 11,
//                  onPressed: _showUrl, child: new Text('website'),),
//                new RaisedButton(
//                    color:Color(0xFF9f0000), textColor: Colors.white,elevation: 11,
//                  onPressed: _showEmail, child: new Text('email'),),
//                new RaisedButton(
//                  color:Color(0xFF9f0000), textColor: Colors.white,elevation: 11,
//                  onPressed: _showSms, child: new Text('sms'),),
//                new RaisedButton(
//                  color:Color(0xFF9f0000), textColor: Colors.white,elevation: 11,
//                  onPressed: _showTelephone, child: new Text('mobil'),),
//
//              ],
//            ),
//          )
//      ),
    );
  }
}

//Container(
//height: 190.0,
//width: 80.0,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(10.0),
//color: Color(0xFF9f0000)
//),
//child: FlatButton.icon(onPressed: _showTelephone,
//icon: Icon(Icons.phone, color: Colors.white,), label: Text('m')),
//)