
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terminal_apps/Views/login.dart';
import 'package:terminal_apps/Views/keberangkatan.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:terminal_apps/Views/Kedatangan.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Login(),
      ),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new Login(),
        '/Home': (BuildContext context) => new Home(),
        '/Datang': (BuildContext context) => new Datang(),
        '/Navbar': (BuildContext context) => new Navbar(),
        '/Profil': (BuildContext context) => new Profil(),
      },
    );
  }
}

class Navbar extends StatefulWidget {
  Navbar({Key key}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final _layoutPage = [Home(), Datang(), Profil()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _layoutPage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavyBar(
          currentIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(MdiIcons.ferry),
              title: Text('Keberangkatan'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(MdiIcons.ferry),
                title: Text('Kedatangan'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(MdiIcons.humanHandsup),
                title: Text('Profil'),
                activeColor: Colors.pink),
          ],
        ),
      ),
    );
  }
}
