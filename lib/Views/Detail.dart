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

  const Detail({Key key, this.id, this.waktu, this.kota, this.statusKegiatan, this.statusKapal, this.statusTiket, this.kapal, this.agenPelayaran, this.updatedAt}) : super(key: key);




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
              padding: EdgeInsets.only(top: 30),
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
                        border: Border.all(color: Colors.lightBlue)),
                    child: Center(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
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
                                      kapal,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                     agenPelayaran,
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
<<<<<<< HEAD
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_downward,
                              size: 20,
                            ),
                            Text(
                              " Kedatangan",
                              style: TextStyle(
                                  fontFamily: 'Lato-Regular', fontSize: 17),
                            )
                          ],
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: kedatangan.substring(11, 16) + " WIB ",
=======
                       Row(
                         children: <Widget>[
                         Icon(Icons.arrow_upward,size: 20,),
                         Text(" kedatangan",style: TextStyle(fontFamily: 'Lato-Regular',fontSize: 17),)
                       ],
                    ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: waktu,
                              hintStyle: TextStyle(color: Colors.black)
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
                          ),
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
<<<<<<< HEAD
                            hintText: kedatangan.substring(0, 11),
=======
                              hintText: waktu,
                              hintStyle: TextStyle(color: Colors.black)
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 10)),
                        Row(
                          children: <Widget>[
<<<<<<< HEAD
                            Icon(
                              Icons.location_city,
                              size: 20,
                            ),
                            Text(" Tujuan",
                                style: TextStyle(
                                    fontFamily: 'Lato-Regular', fontSize: 17))
=======
                            Icon(Icons.location_city,size: 20,),
                            Text(" Tujuan",style: TextStyle(fontFamily: 'Lato-Regular',fontSize: 17)),
>>>>>>> 1fa326bf9f602cf56a98edd8e9ac16907b70b2e0
                          ],
                        ),
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: kota,
                            hintStyle: TextStyle(color: Colors.black)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("Update Status"),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.lightBlue,
                          onPressed: () {},
                          child: Text("On Schedule"),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.lightBlue,
                          onPressed: () {},
                          child: Text("Delay"),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.lightBlue,
                          onPressed: () {},
                          child: Text("Cancel"),
                        )
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
