import 'package:flutter/material.dart';
import 'package:terminal_apps/Views/Home.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:terminal_apps/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatefulWidget {
  final User value;
  Navbar({Key key, this.value}) : super(key:key);
  @override
  _NavbarState createState() => _NavbarState();
}

Future<String> _GetData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString("username");
  String name = prefs.getString("name");
  String role = prefs.getString("role");
  String token = prefs.getString("token");
  return username  ;
}

class _NavbarState extends State<Navbar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int _selectedIndex = 0;
  final _layoutPage=[Home(),Home(),Profil()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _layoutPage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
          _selectedIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.arrow_back),
              title: new Text('Keberangkatan'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.arrow_forward),
              title: new Text('Kedatangan'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              title: Text('Profil')),
          ],
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
