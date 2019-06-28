import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:terminal_apps/Tes.dart';
import 'package:terminal_apps/Navbar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
  static String tag = 'home';
}


class Grup extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Tes.tag: (context) => Home(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter demo ',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}

class _Home extends State<Home> {
  var search = GlobalKey<FormState>();


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<String> dummy = ["Task1","Task2","Task2","Task2","Task2","Task2","Task2"
      ,"Task2","Task2","Task2","Task2","Task2","Task2","Task2","Task2","Task2","Task10"];

    final _layoutPage = [Home(),Tes(),Tes()];
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM yyyy').format(now);


    final textTop = Text(
      'Keberangkatan',
      style: TextStyle(fontSize: 45.0, color: Colors.black, fontFamily: 'SF-UI-Display-Regular'),
      textAlign: TextAlign.left,
    );
    var kalender = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Text(
            'Result 5',
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
            child: Text(formattedDate,
                style: TextStyle(color: Colors.white)),
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
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
        ));
    var kontenList = Padding(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
    );
    Home();

    return SafeArea(
      child: CustomScrollView(
        semanticChildCount: dummy.length,
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
                    children: <Widget>[
                      textTop,
                      kalender,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: searchForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate:SliverChildBuilderDelegate((context,index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child:
                  Container(
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                'assets/img/bonek.png',
                                scale: 3,
                              ),
                            ),
                            Text(dummy[index]),
                          ],
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('10.00',style: TextStyle(color: Colors.black,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                          Text('WIB',style: TextStyle(color: Colors.black,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('2 Hours',style: TextStyle(color: Colors.black,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                          CustomPaint(painter: Drawhorizontalline()),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('12.00',style: TextStyle(color: Colors.black,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                          Text('WIB',style: TextStyle(color: Colors.black,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                colors: [Colors.blueAccent,Colors.purpleAccent],
                                              ),
                                              borderRadius: new BorderRadius.all(Radius.circular(20.0))
                                          ),
                                          child: Center(
                                            child: Text('On Schedule',style: TextStyle(color: Colors.white,fontFamily: 'SF-UI-Display-Regular',fontSize: 15),),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                );
              },
                  childCount: dummy.length)
          )
        ],
      ),
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-90.0, 0.0), Offset(90.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
