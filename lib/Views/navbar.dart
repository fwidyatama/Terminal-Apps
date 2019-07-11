import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:terminal_apps/Views/Home.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:terminal_apps/Models/user.dart';

class Navbar extends StatefulWidget {
  final User value;
  Navbar({Key key, this.value}) : super(key:key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final _layoutPage=[Home(),Profil()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _layoutPage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavyBar(
          currentIndex: _selectedIndex,
          onItemSelected: (index){
            setState(() {
              _selectedIndex=index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Keberangkatan'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Kedatangan'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Profil'),
                activeColor: Colors.pink),
          ],
        ),
      ),
    );
  }
}
