import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:terminal_apps/Views/keberangkatan.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:terminal_apps/Views/Kedatangan.dart';
import 'package:terminal_apps/Models/user.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Navbar extends StatefulWidget {
  final User value;
  Navbar({Key key, this.value}) : super(key:key);
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final _layoutPage=[Home(),Datang(),Profil()];

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