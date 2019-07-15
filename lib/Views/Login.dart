import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
//import 'package:terminal_apps/Models/user.dart';
//import 'package:terminal_apps/Views/navbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //SpinKitThreeBounce _spinKitThreeBounce;
  String errorLogin;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  //globalkey buat state
  var username = GlobalKey<FormState>();
  var password = GlobalKey<FormState>();

  _saveValues(String username, String name, String role, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
    prefs.setString("name", name);
    prefs.setString("role", role);
    prefs.setString("token", token);
  }

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
        String username = datauser['data']['username'];
        String name = datauser['data']['name'];
        String role = datauser['data']['access_role'];
        var token = datauser['meta']['token'];
        _saveValues(username, name, role, token);
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

  TextStyle style = TextStyle(
      fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
      fontSize: 15,
      color: Color.fromRGBO(42, 42, 42, 1));
  Widget build(BuildContext context) {
    var usernameField = Form(
      key: username,
      child: TextFormField(
        controller: _username,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                BorderSide(color: Color.fromRGBO(112, 112, 112, 1))),
            hintText: "Input Username",
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
            hintText: "Password ",
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
          if (username.currentState.validate() &&
              password.currentState.validate()) {
            _login();
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Gagal"),
              duration: Duration(seconds: 5),
            ));
          }
        },
        child: Text("Login",
            style: TextStyle(
                fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
                fontSize: 15,
                color: Color.fromRGBO(42, 42, 42, 1))));

    return SafeArea(
      child:Stack(
        children: <Widget>[
      Column(
      mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 85),
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
