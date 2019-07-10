import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:terminal_apps/Views/Home.dart';
//import 'package:terminal_apps/Views/Detail.dart';
import 'package:terminal_apps/Models/User.dart';
//import 'package:terminal_apps/Views/Profil.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_apps/Navbar.dart';
=======

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_apps/Models/user.dart';
import 'package:terminal_apps/Views/navbar.dart';
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

<<<<<<< HEAD
Future<bool> _SaveData(String username,String name,String role,String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("username", username);
  prefs.setString("name", name);
  prefs.setString("role", role);
  prefs.setString("token", token);
  return prefs.commit();
}

class _LoginState extends State<Login> {
  

  Future<List> _login() async {
    final response = await http.post('http', body: {
      "username": _email.text,
      "password": _password.text,
    });
    var datauser = json.decode(response.body);
    if (response.statusCode == 200) {
      if (datauser == null) {
        setState(() {
          AlertDialog(
            title: Text('Kesalahan'),
            actions: <Widget>[
              Text('Username atau Password anda SALAH'),
            ],
          );
        });
      } else {
        // var route = new MaterialPageRoute(
        //     builder: (BuildContext context) => Navbar(
        //       value: User(
        //         nama: datauser['data']['nama'],
        //         username: datauser['data']['username'],
        //         role: datauser['data']['access_role'],
        //         token: datauser['meta']['token']
        //       ),
        //     )
        // );
        //Navigator.of(context).pushReplacement(route);
        String username = datauser['data']['username'];
        String name = datauser['data']['name'];
        String role = datauser['data']['access_role'];
        String token = datauser['meta']['token'];
        _SaveData(username, name, role, token).then((bool commited){
          Navigator.of(context).pushReplacementNamed("/Navbar");
        });
      }
      setState(() {
        //var token = datauser[1]['token'];
      });
    }
    return datauser;
  }
  
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

=======
class _LoginState extends State<Login> {
  SpinKitThreeBounce _spinKitThreeBounce;
  String errorLogin;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
  //globalkey buat state
  var username = GlobalKey<FormState>();
  var password = GlobalKey<FormState>();
<<<<<<< HEAD
=======

  Future<void> _login() async {
    try {
      final response = await http.post('http://10.2.232.132:80/api/login',
          headers:
          {
            "Accept": 'application/json'
          },
          body: {
            "username": _username.text,
            "password": _password.text,
          });
      var datauser = json.decode(response.body);

      if (response.statusCode == 200) {
       Navigator.pushReplacementNamed(context, '/Navbar');

        var route = new MaterialPageRoute(
              builder: (context) =>
                  Navbar(
                    value: User(
                        token: datauser['meta']['token'],
                      nama: datauser['data']
                    ),
                  ),
          );

        setState(() {
          var token = datauser['meta']['token'];
        });
      }
      else if(response.statusCode==400){
       setState(() {
         errorLogin=datauser['message'];
       });
      }


      return datauser;
    }catch (e) {
      print(e);
    }
  }

>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
  TextStyle style = TextStyle(
      fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
      fontSize: 15,
      color: Color.fromRGBO(42, 42, 42, 1));
  Widget build(BuildContext context) {
    var usernameField = Form(
      key: username,
      child: TextFormField(
<<<<<<< HEAD
        controller: _email,
        keyboardType: TextInputType.emailAddress,
=======
        controller: _username,
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
<<<<<<< HEAD
                    BorderSide(color: Color.fromRGBO(112, 112, 112, 1))),
            hintText: "Input Email",
=======
                BorderSide(color: Color.fromRGBO(112, 112, 112, 1))),
            hintText: "Input Username",
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
            prefixIcon: Icon(
              Icons.email,
              size: 20,
            )),
        validator: (value) {
          if (value.isEmpty) {
            return " Email Kosong";
          }
        },
      ),
    );

    var passwordField = Form(
      key: password,
      child: TextFormField(
        controller: _password,
        keyboardType: TextInputType.text,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
<<<<<<< HEAD
            hintText: "Password Email",
=======
            hintText: "Password ",
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            )),
        validator: (value) {
          if (value.isEmpty) {
            return " Password Kosong";
          }
        },
      ),
    );

    var buttonLogin = OutlineButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30)),
        borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid),
        color: Colors.teal,
        onPressed: () {
<<<<<<< HEAD
          if (email.currentState.validate() &&
              password.currentState.validate()) {
            //Navigator.push(context, MaterialPageRoute(builder:(context)=>Navbar()));
=======
          if (username.currentState.validate() &&
              password.currentState.validate()) {
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
            _login();
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Gagal"),
              duration: Duration(seconds: 5),
            ));
          }
        },
<<<<<<< HEAD
        child: Text("Tes",
=======
        child: Text("Login",
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
            style: TextStyle(
                fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
                fontSize: 15,
                color: Color.fromRGBO(42, 42, 42, 1))));

    return SafeArea(
<<<<<<< HEAD
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
=======
      child:Stack(
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
        children: <Widget>[
      Column(
      mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 85),
<<<<<<< HEAD
          SizedBox(
              height: 200,
              child: Image.asset('assets/img/logo.png', fit: BoxFit.contain)),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Email",
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                emailField,
                const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                Text("Password",
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                passwordField,
                const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 20)),
                Center(child: buttonLogin)
              ],
            ),
          )
        ],
      ),
    );
  }
}
=======
        SizedBox(
            height: 200,
            child: Image.asset('assets/img/logo.png', fit: BoxFit.contain)),
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child:
                Text(errorLogin.toString(),style: TextStyle(fontSize: 15,color: Colors.red),),
    ),
              Text("Username",
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
              usernameField,
              const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
              Text("Password",
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
              passwordField,
              const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 20)),
              Center(child: buttonLogin),
            ],
          ),
        )],
      )
          ])
      );
  }
}
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
