import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Detail.dart';
import 'package:terminal_apps/Models/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terminal_apps/Views/Login.dart' as login;
import 'package:dio/dio.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  SpinKitThreeBounce _spinKitThreeBounce;
  TextEditingController search = TextEditingController();
  List filtered = List();
  List jadwal = List();
  bool isBerangkat;
  String token;
  var query = "";
  var url = login.url + "jadwal/keberangkatan";
  final dio = new Dio();

  @override
  void initState() {
      _getValues();
      _getMoreData();
    super.initState();
  }

  _getValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
    });
  }

  void _getMoreData() async {
    if (url != null) {
      var response = await dio.get(url);
      setState(() {
        url = response.data['links']['next'];
      });
      Iterable tempList = new List();
      tempList =
          response.data['data'].map((data) => Data.fromJson(data)).toList();
      jadwal.addAll(tempList);
    }

    setState(() {
      filtered = jadwal;
    });
  }

  _Home() {
    search.addListener(() {
      if (search.text.isEmpty) {
        setState(() {
          query = "";
          filtered = jadwal;
        });
        print(filtered);
      } else {
        setState(() {
          query = search.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM yyyy').format(now);

    if (search.text.isNotEmpty) {
      List tempList = new List();
      for (int i = 0; i < filtered.length; i++) {
        if (filtered[i]
            .kapal
            .nama
            .toLowerCase()
            .contains(search.text.toLowerCase())) {
          tempList.add(filtered[i]);
        }
      }
      filtered = tempList;
    }

    Widget textTop() {
      return Container(
          padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
          child: Text(
            'Keberangkatan',
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'circular-medium'),
            textAlign: TextAlign.center,
          ));
    }

    Widget kalender() {
      return Row(
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
    }

    Widget searchForm() {
      return Form(
          child: TextFormField(
        controller: search,
        autofocus: false,
        keyboardAppearance: prefix0.Brightness.light,
        decoration: InputDecoration(
          prefixIcon: new Icon(Icons.search),
          hintText: 'Search',
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ));
    }

    Widget _status(String status) {
      if (status.contains("on schedule")) {
        return Container(
          alignment: Alignment.center,
          height: 30,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.green),
          child: Text(
            status,
            style: TextStyle(
                fontFamily: "Montserrat", color: Colors.white, fontSize: 15),
          ),
        );
      } else if (status.contains("delay")) {
        return Container(
          alignment: Alignment.center,
          height: 30,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.blue),
          child: Text(
            status,
            style: TextStyle(
                fontFamily: "Montserrat", color: Colors.white, fontSize: 15),
          ),
        );
      } else if (status.contains("cancel")) {
        return Container(
          alignment: Alignment.center,
          height: 30,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.red),
          child: Text(
            status,
            style: TextStyle(
                fontFamily: "Montserrat", color: Colors.white, fontSize: 15),
          ),
        );
      }
      return null;
    }

    Widget listBuilder() {
      return Expanded(
          child: LazyLoadScrollView(
              scrollOffset: 200,
              onEndOfPage: _getMoreData,
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                    id: filtered[index].id,
                                    kapal: filtered[index].kapal.nama,
                                    agenPelayaran:
                                        filtered[index].agenPelayaran.nama,
                                    kota: filtered[index].kota,
                                    statusKapal: filtered[index].statusKapal,
                                    waktu: filtered[index].waktu,
                                    isBerangkat: true,
                                    token: token,
                                    terakhirDiubah:
                                        filtered[index].updatedAt)));
                      },
                      child: Card(
                        color: Color.fromRGBO(250, 250, 250, 2),
                        elevation: 2,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(250, 250, 250, 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/img/logo_pelni.png',
                                      scale: 3.5,
                                    ),
                                  ),
                                  Text(filtered[index].agenPelayaran.nama)
                                ],
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          filtered[index].kapal.nama,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Montserrat",
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                            height: 5, color: Colors.black26),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: _status(
                                              filtered[index].statusKapal),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        filtered[index]
                                                .waktu
                                                .toString()
                                                .substring(11, 16) +
                                            " WIB",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        filtered[index].kota,
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                },
              )));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            textTop(),
            kalender(),
            Padding(
              padding: EdgeInsets.all(15),
              child: searchForm(),
            ),
            listBuilder()
          ],
        ),
      ),
    );
  }
}
