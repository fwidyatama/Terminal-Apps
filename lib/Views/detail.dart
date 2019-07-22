import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:terminal_apps/Views/login.dart' as login;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terminal_apps/Views/keberangkatan.dart';
import 'package:terminal_apps/Views/kedatangan.dart';

class Detail extends StatefulWidget {
  int id;
  String waktu;
  String kota;
  String statusKegiatan;
  String statusKapal;
  String statusTiket;
  String kapal;
  String agenPelayaran;
  String updatedAt;
  bool isBerangkat;
  String token;
  String terakhirDiubah;

  Detail(
      {this.id,
      this.waktu,
      this.kota,
      this.statusKegiatan,
      this.statusKapal,
      this.statusTiket,
      this.kapal,
      this.agenPelayaran,
      this.updatedAt,
      this.isBerangkat,
      this.token,
      this.terakhirDiubah});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List jadwal = List();
  bool isBerangkat;
  String token;

  Future<void> _updateStatus(String status) async {
    try {
      final response =
          await http.put(login.url + "jadwal/${widget.id}", headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer ${widget.token}",
      }, body: {
        "status_kapal": status,
      });
      if (response.statusCode == 201) {
        showAlert();
        print("Bearer ${widget.token}");
        print(response.statusCode);
        var data = json.decode(response.body);
        print(data['status_kapal']);
        setState(() {
          widget.statusKapal = data['status_kapal'];
          widget.terakhirDiubah = data['updated_at'];
        });
      } else {
        print("Error gan");
      }
    } catch (e) {
      print(e);
    }
  }

  void showAlert() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Berhasil'),
          content: const Text('Berhasil Mengubah Status '),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: widget.isBerangkat == false
                ? AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Datang()));
                      },
                      color: Colors.black,
                      iconSize: 35,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  )
                : AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      color: Colors.black,
                      iconSize: 35,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
            body: Scaffold(
              body: SingleChildScrollView(
                  child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Text("Detail Perjalanan",
                          style: TextStyle(
                            fontSize: 33,
                            fontFamily: 'circular-medium',
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/img/logo_pelni.png',
                                    scale: 3,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.kapal.toString(),
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        widget.agenPelayaran.toString(),
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  )
                                ],
                              ))),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              widget.isBerangkat == false
                                  ? Icon(
                                      Icons.arrow_downward,
                                      size: 20,
                                    )
                                  : Icon(
                                      Icons.arrow_upward,
                                      size: 20,
                                    ),
                              widget.isBerangkat == false
                                  ? Text(
                                      " Kedatangan",
                                      style: TextStyle(
                                          fontFamily: 'Lato-Regular',
                                          fontSize: 17),
                                    )
                                  : Text(
                                      " Keberangkatan",
                                      style: TextStyle(
                                          fontFamily: 'Lato-Regular',
                                          fontSize: 17),
                                    )
                            ],
                          ),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText:
                                    widget.waktu.toString().substring(11, 16) +
                                        " WIB",
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 20,
                              ),
                              Text(" Tanggal",
                                  style: TextStyle(
                                      fontFamily: 'Lato-Regular', fontSize: 17))
                            ],
                          ),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText:
                                    widget.waktu.toString().substring(0, 11),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_city,
                                size: 20,
                              ),
                              Text(" Tujuan",
                                  style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 17)),
                            ],
                          ),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: widget.kota.toString(),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.flag,
                                size: 20,
                              ),
                              Text(" Status Kapal",
                                  style: TextStyle(
                                      fontFamily: 'Lato-Regular',
                                      fontSize: 17)),
                            ],
                          ),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: widget.statusKapal.toString(),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            child: Text("Terakhir Diubah : " +
                                widget.terakhirDiubah.substring(0, 11) +
                                " Pukul : " +
                                widget.terakhirDiubah.substring(11, 16)),
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          Text("Update Status"),
                          SizedBox(
                            width: double.infinity,
                            // height: double.infinity,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.green,
                              onPressed: () {
                                _updateStatus("on schedule");
                              },
                              child: Text(
                                "On Schedule",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            // height: double.infinity,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.blue,
                              onPressed: () {
                                _updateStatus("delay");
                              },
                              child: Text(
                                "Delay",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            // height: double.infinity,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.red,
                              onPressed: () {
                                _updateStatus("cancel");
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            )));
  }
}
