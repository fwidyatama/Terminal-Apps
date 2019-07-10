import 'package:flutter/material.dart';
import 'package:terminal_apps/Models/User.dart';
class Profil extends StatefulWidget {
  final User value;
  Profil({Key key, this.value}) : super(key:key);
  @override
  _ProfilState createState() => _ProfilState();
}
class _ProfilState extends State<Profil> {
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Keluar Aplikasi "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new RaisedButton(
              color: Colors.red,
              elevation: 8,
              highlightElevation: 0,
              child: new Text("Tidak",style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: Colors.green,
              elevation: 8,
              highlightElevation: 0,
              child: new Text("Ya",style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/img/logo.png',
                  scale: 4,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.account_circle,size: 20,),
                        Text("Username",style: TextStyle(fontFamily: 'Lato-Regular',fontSize: 17),)
                      ],
                    ),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.person,size: 20,),
                        Text("Nama",style: TextStyle(fontFamily: 'Lato-Regular',fontSize: 17),)
                      ],
                    ),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
//                        hintText: '${widget.value.nama}',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work,size: 20,),
                        Text(" Role",style: TextStyle(fontFamily: 'Lato-Regular',fontSize: 17))
                      ],
                    ),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        //hintText: '${widget.value.role}',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                onPressed: () {
                  _showDialog();
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(13.0),
                  child: const Text('Keluar',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}