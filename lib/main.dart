import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terminal_apps/Views/Home.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:terminal_apps/Views/Login.dart';
import 'package:terminal_apps/Navbar.dart';

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
        body: Profil(),
      ),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/Login' : (BuildContext context) => new Login(),
        '/Navbar' : (BuildContext context) => new Navbar(),
      },
    );
  }
}



