import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/beranda.dart' as _firstTab;
import './screens/unminut.dart' as _secondTab;
import './screens/contact.dart' as _thirdTab;
import './screens/events.dart';
import './screens/interviuri.dart';
import './tabs/film.dart';
import './tabs/teatre.dart';

void main() => runApp(new MaterialApp(
  title:'a7arta',
  debugShowCheckedModeBanner: false,

  theme: new ThemeData(
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFF9f0000), backgroundColor: Colors.pink
  ),
  home: new Tabs(),
));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
    : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              blurRadius: 25.0,
            )
          ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {
  
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        _title_app, 
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new PageView(
      controller: _tabController,
      onPageChanged: onTabChanged,
      children: <Widget>[
        new _firstTab.HomeMain(),
        new _secondTab.MinutePage(),
        new _thirdTab.ContactMe()
      ],
    ),

    //Tabs
    bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Color(0xFF9f0000),
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ):
      new BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
    ),

    //Drawer
    drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          new Container(
            height: 120.0,
            child: new DrawerHeader(
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                gradient: LinearGradient(colors: <Color>[Colors.white, Color(0xFFECEFF1)])
                
//                color: new Color(0xFFECEFF1),
                
              ),
              child: new Center(
                child: new Image.asset('images/logo.png',
                    width: 270.0, height: 120.0),
              ),
            ),
          ),
          SizedBox(height: 11.0),
          new ListTile(
            leading: new Icon(Icons.account_balance, color: Color(0xFF9f0000),),
            trailing: new Icon(Icons.play_arrow,  color: Color(0xFF9f0000)),
            title: new Text('TEATRU'),
            onTap: () {
              Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) => new TeatruPage()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.videocam, color: Color(0xFF9f0000),),
            title: new Text('1001 FILME'),
            trailing: new Icon(Icons.play_arrow,  color: Color(0xFF9f0000)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilmePage(),
                  ));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.event_note, color: Color(0xFF9f0000),),
            trailing: new Icon(Icons.play_arrow,  color: Color(0xFF9f0000)),
            title: new Text('EVENIMENTE'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage(),
                  ));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.mic, color: Color(0xFF9f0000),),
            trailing: new Icon(Icons.play_arrow,  color: Color(0xFF9f0000)),
            title: new Text('INTERVIURI'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InterviuriPage(),
                    ));
              },
          ),
//          new ListTile(
//            leading: new Icon(Icons.contacts),
//            title: new Text('Test'),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Test(),
//              ));
//              }
//          ),

          new Divider(),
          new ListTile(
            leading: new Icon(Icons.exit_to_app),
            title: new Text('INCHIDE'),
            onTap: () {
              Navigator.pop(context);
            }
          ),
        ],
      )
    )
  );

void onTap(int tab){
  _tabController.jumpToPage(tab);
}

void onTabChanged(int tab) {
  setState((){
    this._tab = tab;
  });

  switch (tab) {
    case 0:
      this._title_app = TabItems[0].title;
      break;

    case 1:
      this._title_app = TabItems[1].title;
      break;

    case 2:
      this._title_app = TabItems[2].title;
      break;
  }
}
}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'ACASA', icon: Icons.home),
  const TabItem(title: 'UN MINUT', icon: Icons.favorite),
  const TabItem(title: 'CONTACT', icon: Icons.fingerprint)
];


