import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'Detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terminal_apps/Views/login.dart' as login;
class Datang extends StatefulWidget {
  @override
  _Datang createState() => _Datang();
  static String tag = 'home';
}

class _Datang extends State<Datang> {
  SpinKitThreeBounce _spinKitThreeBounce;
  TextEditingController search = TextEditingController();
  List jadwal = List();
  bool isBerangkat;

  final dio = new Dio();
  var cari = "";
  List filtered = new List();

  @override
  void initState() {
    _spinKitThreeBounce = SpinKitThreeBounce(
      color: Colors.blue,
    );
    super.initState();
    _getNames();
  }

  void _getNames() async {
    try {
      final response = await dio.get(login.url+"jadwal/kedatangan");
      List tempList = new List();
        if(response.statusCode == 200){
          for (int i = 0; i < response.data['data'].length; i++) {
          tempList.add(response.data['data'][i]);
        }
        setState(() {
          jadwal = tempList;
          filtered = jadwal;
        });
      }
    }
    catch(e) {
      //TODO IDONTKNOW
    }
  }

  Widget _status(String status){
          if(status.contains("on schedule")){
            return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.green
                    ),
                    child: Text(status,style: TextStyle(fontFamily: "Montserrat",color: Colors.white,fontSize: 15),),
                  );
          }else if (status.contains("delay")){
            return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.blue
                    ),
                    child: Text(status,style: TextStyle(fontFamily: "Montserrat",color: Colors.white,fontSize: 15),),
                  );
          }else if (status.contains("canceled")){
            return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.red
                    ),
                    child: Text(status,style: TextStyle(fontFamily: "Montserrat",color: Colors.white,fontSize: 15),),
                  );
          }
    }

  _Datang() {
    search.addListener(() {
      if (search.text.isEmpty) {
        setState(() {
          cari = "";
          filtered = jadwal;
        });
      } else {
        setState(() {
          cari = search.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM yyyy').format(now);


    if (!(search.text.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filtered.length; i++) {
        if (filtered[i]['kapal']['nama'].toLowerCase().contains(search.text.toLowerCase())) {
          tempList.add(filtered[i]);
        }
      }
      filtered = tempList;
    }

    final textTop = Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
          child: Text(
            filtered.length.toString() + " Results",
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
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
        child: TextFormField(
          autofocus: false,
          obscureText: false,
          controller: search,
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
                  semanticChildCount: jadwal == null ? 0 : filtered.length,
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 215,
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
                                          id: filtered[index]['id'],
                                          kapal: filtered[index]['kapal']['nama'],
                                          agenPelayaran: filtered[index]['agen_pelayaran']['nama'],
                                          kota: filtered[index]['kota'],
                                          statusKapal: filtered[index]['status_kapal'],
                                          waktu: filtered[index]['waktu'],
                                          isBerangkat: false,
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
                                        MainAxisAlignment.spaceEvenly,
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
                                              Text(filtered[index]['kapal']['nama'].toString()),
                                            ],
                                          ),
                                          Expanded(
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(filtered[index]['kapal']['nama'].toString(),style: TextStyle(fontFamily: "Montserrat",fontSize: 16,color: Colors.blueGrey),),
                                                    Divider(height: 2,),
                                                    SizedBox(height: 3,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Column(
                                                          children: <Widget>[
                                                            Text(filtered[index]['waktu'].substring(11, 16).toString()+" WIB",style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold),),

                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            Container(
                                                              child: _status(filtered[index]['status_kapal'].toString() ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Text(filtered[index]['kota'],style: TextStyle(color: Colors.blueGrey,fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.bold),),
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
                      }, childCount: jadwal == null ? 0 : filtered.length),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
