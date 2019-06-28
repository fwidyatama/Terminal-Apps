import 'package:flutter/widgets.dart';

class Config {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double sizeHeight;
  static double sizeWidht;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    sizeHeight = _mediaQueryData.size.height /  100;
    sizeWidht = _mediaQueryData.size.width / 100;
  }
}