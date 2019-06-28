import 'package:flutter/material.dart';
import 'package:terminal_apps/Tes.dart';
import 'package:terminal_apps/Home.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int _selectedIndex = 0;
  final _layoutPage=[Home(),Tes(),Tes()];
 
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
                icon: Icon(Icons.person), title: Text('Profil')),
          ],
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
