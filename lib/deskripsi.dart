import 'package:flutter/material.dart';

class Deskripsi extends StatefulWidget {
  @override
  _DeskripsiState createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text('Keberangkatan',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 30)),
            ),
            Container(
                height: queryData.size.height / 2,
                width: queryData.size.width,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: Colors.grey[300], width: 2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/img/bonek.png',
                            scale: 3,
                          ),
                          Text(
                            'DLU',
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 12),
                          ),
                          Text(
                            'Dewaruci 1',
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 20),
                          ),
                          Container(
                              color: Colors.transparent,
                              width: queryData.size.width / 1,
                              height: queryData.size.height / 3,
                              child:Column()),
                        ],
                      ),
                    ))),
            Container(
                height: queryData.size.height / 3,
                width: queryData.size.width,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: Colors.grey[300], width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.transparent,
                            width: queryData.size.width / 1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Status Kapal',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 30),
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: queryData.size.width,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(25, 193, 0, 10),
                                        Color.fromRGBO(142, 193, 0, 1)
                                      ]),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text(
                                      'On Schedule',
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: queryData.size.width,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(0, 76, 198, 10),
                                        Color.fromRGBO(152, 0, 198, 1)
                                      ]),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text('Delay',
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: queryData.size.width,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(249, 120, 0, 10),
                                        Color.fromRGBO(245, 75, 75, 1)
                                      ]),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text('Canceled',
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )))
          ],
        )
      ],
    )));
  }
}
