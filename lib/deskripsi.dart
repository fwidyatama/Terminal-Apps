  import 'package:flutter/material.dart';

class Deskripsi extends StatefulWidget {
  @override
  _DeskripsiState createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text('Keberangkatan',style: TextStyle(fontFamily: 'Montserrat',)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    ));
  }
}
