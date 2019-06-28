import 'package:flutter/material.dart';

void main()=>runApp(Tes());

class Tes extends StatelessWidget {
  static final tag ="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tes",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hehe"),

        ),
      ),
    );
  }
}
