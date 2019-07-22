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

class Datang extends StatefulWidget {
  @override
  _Datang createState() => _Datang();
}

class _Datang extends State<Datang> {
  SpinKitThreeBounce _spinKitThreeBounce;
  TextEditingController search = TextEditingController();
  List filtered = List();
  List jadwal = List();
  bool isBerangkat;
  String token;
  var query = "";
  var url = login.url + "jadwal/kedatangan";
  final dio = new Dio();

  @override
  void initState() {
    _spinKitThreeBounce = SpinKitThreeBounce(
      color: Colors.blue,
    );
    _getValues();
    super.initState();
    _getMoreData();
  }

  void loading() {
    _spinKitThreeBounce = SpinKitThreeBounce(
      color: Colors.blue,
    );
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

  _Datang() {
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

    if (!(search.text.isEmpty)) {
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

    final textTop = Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 5),
        child: Text(
          'KeDatangan',
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
        child: TextFormField(
      controller: search,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        prefixIcon: new Icon(Icons.search),
        hintText: 'Search',
        contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    ));

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
              color: Colors.yellow),
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
    }

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: <Widget>[
          _spinKitThreeBounce,
          SafeArea(
              child: LazyLoadScrollView(
            scrollOffset: 100,
            onEndOfPage: () => _getMoreData(),
            child: CustomScrollView(
              semanticChildCount: jadwal == null ? 0 : filtered.length,
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
                                      id: filtered[index].id,
                                      kapal: filtered[index].kapal.nama,
                                      agenPelayaran:
                                          filtered[index].agenPelayaran.nama,
                                      kota: filtered[index].kota,
                                      statusKapal: filtered[index].statusKapal,
                                      waktu: filtered[index].waktu,
                                      isBerangkat: false,
                                      token: token,
                                      terakhirDiubah:
                                          filtered[index].updatedAt)));
                        },
                        child: Column(
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                                        Text(filtered[index]
                                            .kapal
                                            .nama
                                            .toString())
                                      ],
                                    ),
                                    Expanded(
                                        child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            filtered[index]
                                                    .waktu
                                                    .substring(11, 16)
                                                    .toString() +
                                                " WIB",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Montserrat",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Divider(
                                            height: 2,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Text(
                                                    filtered[index]
                                                            .waktu
                                                            .substring(11, 16)
                                                            .toString() +
                                                        " WIB",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    child: _status(
                                                        filtered[index]
                                                            .statusKapal
                                                            .toString()),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
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
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                }, childCount: jadwal == null ? 0 : filtered.length)),
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
