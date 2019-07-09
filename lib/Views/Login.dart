import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terminal_apps/Views/Home.dart';
import 'package:terminal_apps/Views/Detail.dart';
import 'package:terminal_apps/Models/User.dart';
import 'package:terminal_apps/Views/Profil.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_apps/Navbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
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
        Navigator.pushReplacementNamed(context, '/Navbar');
        var route = new MaterialPageRoute(
            builder: (BuildContext context) => Navbar(
              value: User(
                nama: datauser['data']['nama'],
                username: datauser['data']['username'],
                role: datauser['data']['access_role'],
                token: datauser['meta']['token']
              ),
            )
        );
        
      }
      setState(() {
        var token = datauser[1]['token'];
      });
    }
    return datauser;
  }

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  //globalkey buat state
  var email = GlobalKey<FormState>();
  var password = GlobalKey<FormState>();
  TextStyle style = TextStyle(
      fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
      fontSize: 15,
      color: Color.fromRGBO(42, 42, 42, 1));
  Widget build(BuildContext context) {
    var emailField = Form(
      key: email,
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Color.fromRGBO(112, 112, 112, 1))),
            hintText: "Input Email",
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
            hintText: "Password Email",
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
          if (email.currentState.validate() &&
              password.currentState.validate()) {
            //Navigator.push(context, MaterialPageRoute(builder:(context)=>Navbar()));
            _login();
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Gagal"),
              duration: Duration(seconds: 5),
            ));
          }
        },
        child: Text("Tes",
            style: TextStyle(
                fontFamily: 'SF-UI-Display-Regular-UI-Display-Regular',
                fontSize: 15,
                color: Color.fromRGBO(42, 42, 42, 1))));

    return SafeArea(
      child: Column(
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
