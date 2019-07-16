import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'Detail.dart';
import 'package:terminal_apps/Models/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terminal_apps/Views/Login.dart' as login;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
  static String tag = 'home';
}

class _Home extends State<Home> {
  SpinKitThreeBounce _spinKitThreeBounce;
  var search = GlobalKey<FormState>();
  List jadwal = List();
  //int _selectedIndex = 0;

  @override
  void initState() {
    _spinKitThreeBounce = SpinKitThreeBounce(
      color: Colors.blue,
    );
    super.initState();
    _getJadwal();
  }

  _getJadwal() async {
   try{
     var response = await http.get(login.url+"jadwal");
    if(response.statusCode==200){
      setState(() {
        final data = json.decode(response.body);
        jadwal = data['data'].map((data)=>Data.fromJson(data)).toList();
      });
    }
   }
   catch (e){
     throw Exception(e.toString());
   }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM yyyy').format(now);

    final textTop = Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
        child: Text(
          'Keberangkatan',
          style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'circular-medium'),
          textAlign: TextAlign.center,
        ));

    var kalender = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Text(
            jadwal.length.toString() + " Results",
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: () {},
            color: Colors.blueAccent,
            padding: EdgeInsets.all(12),
            child: Text(formattedDate, style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
    var searchForm = Form(
        key: search,
        child: TextFormField(
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search',
            contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
        ));

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: <Widget>[
          _spinKitThreeBounce,
          SafeArea(
            child: CustomScrollView(
              semanticChildCount: jadwal.length,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 220,
                  floating: false,
                  pinned: false,
                  backgroundColor: Colors.white,
                  primary: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            textTop,
                            kalender,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: searchForm,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                         id: jadwal[index].id,
                                      kapal: jadwal[index].kapal.nama,
                                      agenPelayaran: jadwal[index].agenPelayaran.nama,
                                      kota: jadwal[index].kota,
                                      statusKapal: jadwal[index].statusKapal,
                                      waktu: jadwal[index].waktu,
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                              'assets/img/logo_pelni.png',
                                              scale: 3.5,
                                            ),
                                          ),
                                          Text(jadwal[index].kapal.nama.toString()),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(jadwal[index].kapal.nama.toString(),style: TextStyle(fontFamily: "Montserrat",fontSize: 16,color: Colors.blueGrey),),
                                              Divider(height: 2,),
                                              SizedBox(height: 3,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Column(
                                                    children: <Widget>[
                                                      Text(jadwal[index].waktu.substring(11, 16).toString()+" WIB",style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold),),
                                                      
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        alignment: Alignment.center,
                                                        height: 30,
                                                        width: 130,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(25)),
                                                          gradient: LinearGradient(colors: [Colors.green,Colors.indigo])
                                                        ),
                                                        child: Text(jadwal[index].statusKapal,style: TextStyle(fontFamily: "Montserrat",color: Colors.white,fontSize: 15),),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3,),
                                              Text(jadwal[index].kota,style: TextStyle(color: Colors.blueGrey,fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                      )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  }, childCount: jadwal.length),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
