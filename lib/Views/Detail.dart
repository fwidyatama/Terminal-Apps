import 'package:flutter/material.dart';
import 'package:terminal_apps/Models/data.dart';

class Detail extends StatelessWidget {
  final int id;
  final String waktu;
  final String kota;
  final String statusKegiatan;
  final String statusKapal;
  final String statusTiket;
  final String kapal;
  final String agenPelayaran;
  final String updatedAt;

  const Detail(
      {Key key,
      this.id,
      this.waktu,
      this.kota,
      this.statusKegiatan,
      this.statusKapal,
      this.statusTiket,
      this.kapal,
      this.agenPelayaran,
      this.updatedAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                color: Colors.black,
                iconSize: 35,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Scaffold(
              body: Container(
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
                        color: Colors.white,),
                    child: Center(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  'assets/img/logo_pelni.png',
                                  scale: 3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      kapal.toString(),
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      agenPelayaran.toString(),
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
                            Icon(
                              Icons.arrow_upward,
                              size: 20,
                            ),
                            Text(
                              " kedatangan",
                              style: TextStyle(
                                  fontFamily: 'Lato-Regular', fontSize: 17),
                            )
                          ],
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: waktu.toString(),
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
                              hintText: waktu.toString(),
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
                                    fontFamily: 'Lato-Regular', fontSize: 17)),
                          ],
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: kota.toString(),
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
                                    fontFamily: 'Lato-Regular', fontSize: 17)),
                          ],
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: statusKapal.toString(),
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: <Widget>[
                        Text("Update Status"),
                        SizedBox(
                          width: double.infinity,
                          // height: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.green,
                            onPressed: () {},
                            child: Text("On Schedule"),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          // height: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.yellow,
                            onPressed: () {},
                            child: Text("Delay"),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          // height: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.red,
                            onPressed: () {},
                            child: Text("Canceled"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        )
      );
  }
}
