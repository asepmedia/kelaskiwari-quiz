import 'package:flutter/material.dart';

class ScreenHelper {
  BuildContext context;

  ScreenHelper(this.context);

  double textScale(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.013;
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getHeight(double size) {
    double calc = size / 1000;
    return screenHeight(context) * calc;
  }

  double getSize(double size) {
    double calc = size / 500;
    return screenHeight(context) * calc;
  }

  double getTextSize(double size) {
    double calc = size / 10;
    return textScale(context) * calc;
  }
}
