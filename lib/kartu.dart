import 'package:flutter/material.dart';

class Kartu extends StatefulWidget {
  @override
  _KartuState createState() => _KartuState();
  static String tag = 'card';
}

class _KartuState extends State<Kartu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'images/bonek.png',
                  scale: 3,
                ),
              ),
              Text('BONEK'),
            ],
          ),
          VerticalDivider(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
          ),
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
