import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terminal_apps/Views/navbar.dart';
import 'package:terminal_apps/Views/login.dart';
import 'package:terminal_apps/Views/keberangkatan.dart';
import 'package:terminal_apps/Views/Profil.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Ehehe",
      home: Scaffold(resizeToAvoidBottomPadding: false,
        body: Login(),
      ),
      routes: <String,WidgetBuilder>{
        '/Login' : (BuildContext context) => new Login(),
        '/Home' : (BuildContext context) => new Home(),
        '/Navbar' : (BuildContext context) => new Navbar(),
        '/Profil' : (BuildContext context) => new Profil(),
      },
    );
  }
}



