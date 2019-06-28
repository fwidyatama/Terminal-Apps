import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}
class _ProfilState extends State<Profil>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/img/logo.png',scale: 4,),
              ),
              Text('Nama : Kevin Haidar',style: TextStyle(fontFamily: 'Montserrat'),),
              Text('NIP  : 165150201111196',style: TextStyle(fontFamily: 'Montserrat'),),
              RaisedButton(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueAccent,Colors.cyan]
                      )
                    ),
                    child: Text('Keluar'),
                ),
              )
            ],
          )
      ],),
    );
  }
}