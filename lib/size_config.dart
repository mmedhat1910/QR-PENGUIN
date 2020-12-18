import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getPercentageOfHeight(double percent) {
  double screenHeight = SizeConfig.screenHeight;
  return (percent / 100) * screenHeight;
}

double getPercentageOfWidth(double percent) {
  double screenWidth = SizeConfig.screenWidth;
  return (percent / 100) * screenWidth;
}

void getOrientation = () => print(SizeConfig.orientation);
