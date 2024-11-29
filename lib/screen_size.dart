import 'package:flutter/material.dart';

class ScreenSize {
  static double height = 0, width = 0;

  void initSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}
